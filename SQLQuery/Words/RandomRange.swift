//
//  RandomRange.swift
//  TestSQLQuery
//
//  Created by Vinicius Mesquita on 07/10/20.
//

enum RandomRange: String {
    
    case A, B, C, D, E,
         F, G, H, I, J,
         K, L, M, N, O,
         P, Q, R, S, T,
         U, V, W, X, Y,
         Z
    
    private var resul: Int {
        switch self {
        case .A: return 29055; case .B: return 13137; case .C: return 31947;
        case .D: return 12122; case .E: return 2191;  case .F: return 10038;
        case .G: return 9568;  case .H: return 9278;  case .I: return 8914;
        case .J: return 3281;  case .K: return 95;    case .L: return 9271;
        case .M: return 22884; case .N: return 6352;  case .O: return 7542;
        case .P: return 24323; case .Q: return 2984;  case .R: return 8735;
        case .S: return 13503; case .T: return 16389; case .U: return 2626;
        case .V: return 5245;  case .W: return 46;    case .X: return 806;
        case .Y: return 16;    case .Z: return 955;
        }
    }
    
    static func max(character: RandomRange.RawValue) -> Int {
        guard let result = RandomRange.init(rawValue: character)?.resul else {
            return 10
        }
        return result
    }
}
