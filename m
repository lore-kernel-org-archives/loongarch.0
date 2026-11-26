Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664472;
	b=uJL/6VYYQE+dtNNSj3CY7uVkIiWFcL6OdWqu2SFTneFAiaugo9bQ1IVtduILJQH4hWat
	 GWxJFXCBl4t1jC8Jvncd9xh2ketxdA9UoPWV/D6pYT+gxAjZqaWlTiQXLkDS+XlTYUXTZ
	 1eyJbpE7ynly7UP5rbu6zugOh86uaOlprVrZgmKR+r7gCJfq8Pduw5aq6AjN7x80GWnZ8
	 wOjgO+zwPk5M4mJPfW21HlkKG66L7W8LoJY8DtQazzYry2UZQyfRCtX3txwHZH3xZySd4
	 KstbvDJnXf+mVSJhkLz5HZ2jfaLzJh24VTvzKFYNog/9aQE67mbCmFIA9EdA/YILwNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664472;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WWcpvyiKx9QdAEGQBV+Rm5SmC+zVbKadnyjvc+R3wRA=;
	b=OhbX1xfFAG88WXFK0pb82hh2QiE+4eBMs/4Sw0v6M44FKBjN8W1jWwilBEOLBIcZX4IT
	 otnXDfdZp0lLspporgpSekjeg3O5K4dLhF0jMDZgKxLIuMyM8CeRlThu9EzSPmj6bGMmN
	 q6+f4lOk7HTZJ+BsNgkZG56UOVEbm0eDJ9OydCWLkh7fmwhN6lPebj6wIHjyNQX4Hha8V
	 AmAfxZQ+23Fmh3UG00nXINVyaU4ScnDQE1GUJmNOS9Adiqwk2EKko1T4OCKFDWUXVd+VM
	 p7q0ZASyf9N42nkKP470SUo2BGVNkAnAHb+RIqyZtiYluwkR167vN9mCzC2SbFrW1iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XP85efvG;
	arc=none smtp.remote-ip=95.215.58.232
Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A26606A33D
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 03:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A26606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XP85efvG
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=F3uhmG/jC5tq5XsmcCz1nyolzy2MtfiIpZ5NsbKeVf0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795664469; v=1; x=1796269269;
 b=XP85efvG8Iv5LvXElHt56+QgtdQuNcpPX/wcUheblQV7Qa2nyhxSaKATKVv6MXhhu3W7qoi6
 mHPPsQYJ5wBvz5+X8M5rlOcTgrQWDJyZJB3HjrTP+KoDQQkweGPELpq34YzyDi8L34wzLOtjSYV
 jNJg0AYnRYDobZWI4TO2iNNA=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4c2135ef4223dfca;
	Thu, 26 Nov 2026 03:41:09 +0000
X-Mizu-Trace-ID: 4c2135ef4223dfca
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn
Cc: hengqi.chen@gmail.com,
	guodongtai@kylinos.cn,
	bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] LoongArch: BPF: Add support for signed arena loads
Date: Thu, 26 Nov 2026 12:40:46 +0900
Message-ID: <20261126034048.7370-5-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126034048.7370-1-dongtai.guo@linux.dev>
References: <20261126034048.7370-1-dongtai.guo@linux.dev>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Guo <guodongtai@kylinos.cn>

Currently, the verifier rejects sign-extending loads from arena on
LoongArch with "sign extending loads from arena are not supported yet",
because the JIT does not implement bpf_jit_supports_insn() and the weak
default returns false.

In order to support them, implement bpf_jit_supports_insn() and handle
BPF_PROBE_MEM32SX like BPF_PROBE_MEM32: add the arena base held in
REG_ARENA to the address, use sign-extending load instructions, and add
an exception table entry for the load.

This is similar to commit b4757714cc63 ("bpf, riscv: Add support for
signed arena loads").

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/net/bpf_jit.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 20f29ea01bda..03c88cd9c96a 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -709,7 +709,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
 
 	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
 	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
-	    BPF_MODE(insn->code) != BPF_PROBE_MEM32)
+	    BPF_MODE(insn->code) != BPF_PROBE_MEM32 &&
+	    BPF_MODE(insn->code) != BPF_PROBE_MEM32SX)
 		return 0;
 
 	if (WARN_ON_ONCE(ctx->num_exentries >= ctx->prog->aux->num_exentries))
@@ -1389,10 +1390,16 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
+	/* LDX | PROBE_MEM32SX: dst = *(signed size *)(src + REG_ARENA + off) */
+	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_W:
 		sign_extend = BPF_MODE(code) == BPF_MEMSX ||
-			      BPF_MODE(code) == BPF_PROBE_MEMSX;
+			      BPF_MODE(code) == BPF_PROBE_MEMSX ||
+			      BPF_MODE(code) == BPF_PROBE_MEM32SX;
 
-		if (BPF_MODE(code) == BPF_PROBE_MEM32) {
+		if (BPF_MODE(code) == BPF_PROBE_MEM32 ||
+		    BPF_MODE(code) == BPF_PROBE_MEM32SX) {
 			emit_insn(ctx, addd, t2, src, REG_ARENA);
 			src = t2;
 		}
@@ -2676,6 +2683,11 @@ bool bpf_jit_supports_arena(void)
 #endif
 }
 
+bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
+{
+	return true;
+}
+
 bool bpf_jit_supports_fsession(void)
 {
 	return true;
-- 
2.53.0

