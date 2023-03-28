Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27FEBB
	for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 07:19:10 +0000 (UTC)
X-UUID: 0fdb51c7ccf84897a8c346005d2bc822-20230328
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:530e9fa5-b352-4298-a12d-a821b6d44155,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:11
X-CID-INFO: VERSION:1.1.20,REQID:530e9fa5-b352-4298-a12d-a821b6d44155,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:11
X-CID-META: VersionHash:25b5999,CLOUDID:d07ab529-564d-42d9-9875-7c868ee415ec,B
	ulkID:230328151339VN7RZSUH,BulkQuantity:0,Recheck:0,SF:24|17|19|42|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 0fdb51c7ccf84897a8c346005d2bc822-20230328
X-User: guodongtai@kylinos.cn
Received: from localhost.localdomain [(210.12.40.82)] by mailgw
	(envelope-from <guodongtai@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 910755339; Tue, 28 Mar 2023 15:13:38 +0800
From: George Guo <guodongtai@kylinos.cn>
To: daniel@iogearbox.net
Cc: ast@kernel.org,
	bpf@vger.kernel.org,
	chenhuacai@kernel.org,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	masahiroy@kernel.org,
	michal.lkml@markovi.net,
	ndesaulniers@google.com
Subject: [PATCH v2] loongarch/bpf: Skip speculation barrier opcode, which caused ltp testcase bpf_prog02 to fail
Date: Tue, 28 Mar 2023 15:13:35 +0800
Message-Id: <20230328071335.2664966-1-guodongtai@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c1932d0d-cf3f-5005-958d-7e08dddf42c9@iogearbox.net>
References: <c1932d0d-cf3f-5005-958d-7e08dddf42c9@iogearbox.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here just skip the opcode(BPF_ST | BPF_NOSPEC) that has no couterpart to the loongarch.

To verify, use ltp testcase:

Without this patch:
$ ./bpf_prog02
... ...
bpf_common.c:123: TBROK: Failed verification: ??? (524)

Summary:
passed   0
failed   0
broken   1
skipped  0
warnings 0

With this patch:
$ ./bpf_prog02
... ...
Summary:
passed   0
failed   0
broken   0
skipped  0
warnings 0

Signed-off-by: George Guo <guodongtai@kylinos.cn>

---
Changelog:
v2:
	- place it to build_insn
	- add printing for skipping bpf_jit the opcode
---
 arch/loongarch/net/bpf_jit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 288003a9f0ca..d3c6b1c4ccbb 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1022,6 +1022,11 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 		emit_atomic(insn, ctx);
 		break;
 
+	/* Speculation barrier */
+	case BPF_ST | BPF_NOSPEC:
+		pr_info_once("bpf_jit: skip speculation barrier opcode %0x2x\n", code);
+		break;
+
 	default:
 		pr_err("bpf_jit: unknown opcode %02x\n", code);
 		return -EINVAL;
-- 
2.34.1

