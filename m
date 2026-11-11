Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390749;
	b=V2zKS7/ieWaWUkWL+Q0IlON5JIXYqJ7h8Yko3mx3Px9GrVvWMNYlPEoy9GVRST1id7Xd
	 BP0Fsc+b0fta71ZvCry6wFzw0M35XO76Zeiv5g0uM3gOJ5V48liOBDoxCfWSxQ+tSxXzJ
	 ACe5U9ACNQJbtHfpFQaXjlKWRsvsDF9jWIHZQ/zkWQqUlVsu6aPAFi7Wb5Gqa54S/ymz2
	 PLUAC4ZzexmC5kB3ypR1cu28WzUA/9cptLHzPXEh0ABbfIKAzW4U/jGwf3mrhlSl5wTNK
	 jBZ0dnou0TK9LT+OMmkDM2xBlrm978+7930TvlZZ0WEX5IzQej/0F11Emui9yJDDZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390749;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=3Uussg3Rcj68dSiyBcrCPbebWeaDOBXJizT7820bclo=;
	b=q+u1tZ0y4DvJRA39PG+mMzNTKW4gHcNCharS09UA5YPEXmNJp6OuaBZIVs0i8gmnqL+J
	 Zmij+7Pyt/aNp6R8DljX/1LRNY1zVaJXPWaz2h0+EjZeHXAVDXxvFoJilIBmCWB3+SA1a
	 mum/XsUFDpQbPrrHmZb49SJGR4EmI1DRM81jWGWadtM3NDfKgs1O+a+BtVFpPrlc4kEfP
	 ZROi8TlHwn2TTIAJlveTF9EGbm6ZuF5ddqiySQpQegod0KxfeScSRMJJ3Bq0n2Bm80jpz
	 9tU6h/k9ZmOG6sbGL90COT62Y7Ir9cqqyuB12flnn7VeOnwhD1gOIyKAKwPYOj9GnAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AED606A32E
	for <loongarch@lists.linux.dev>; Wed, 11 Nov 2026 09:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AED606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxUNHaOvRqZIEeAA--.22889S3;
	Wed, 11 Nov 2026 17:52:26 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zSOvRqrLMzAA--.12000S4;
	Wed, 11 Nov 2026 17:52:25 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] LoongArch: BPF: Add support for indirect jumps
Date: Wed, 11 Nov 2026 17:52:16 +0800
Message-ID: <20261111095217.31415-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261111095217.31415-1-yangtiezhu@loongson.cn>
References: <20261111095217.31415-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxg8zSOvRqrLMzAA--.12000S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFy5Zr1rXr1DCr4furWUWrX_yoWfKrX_Kw
	13Ja4xW395WF48A3WYgayfXFyqk348XFn09r9FgrW8uas8try3ArWvqas5C3y7KrWYka13
	W3s3t3sIyw42vosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

In order to implement JIT support for the indirect jump instruction
(BPF_JMP | BPF_JA | BPF_X), emit a jirl instruction to jump to the
target address held in rd without saving PC+4 into return address.

This is similar to commit f4a66cf1cb14 ("bpf: arm64: Add support for
indirect jumps").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 26904010d9b5..64abebd9c950 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1184,6 +1184,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			goto toofar;
 		break;
 
+	case BPF_JMP | BPF_JA | BPF_X:
+		emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, rd, 0);
+		break;
+
 	/* PC += off */
 	case BPF_JMP | BPF_JA:
 		jmp_offset = bpf2la_offset(i, off, ctx);
-- 
2.42.0

