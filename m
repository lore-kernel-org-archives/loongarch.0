Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408756;
	b=goN9jWXpWtOuNoM2BI4JdMlDEPWjMyKbJn8YNG4bWdTWzi7kqQhQFJcr45Hk4qMcLl+z
	 SvplhSLmIwLz1iCXlwS7znh6LAek/6FpyrhlTtxXEShpIoGRCuQLG9gmNfdF7tNQd1vkA
	 7c62kgYhXRX/nnC5t0wGFqCMxzlfV/v+myMp14oqToltB8tEYtN+e4P9OupenOhgMQ1I/
	 s/ZLQf5T8fWEhbFIt4Ykl7oRGCsLDL0+C8HwbbqCN77R2bdrvBgsoSl9Z9Ao4/wJLliT0
	 pD3ROigocRcCoODwASuGhttpLnoPcqSNnXnMBZCKMcUFU7RZ5Obk8zf6BIyNLANkWMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408756;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=wktoHsTPl0uC0mTAWi6j6QZypwk4cQFTMLqetgOCy5k=;
	b=HKtk3fXXmbKMYph2zjW/RvpMfTm0mCdAGBHfgJMRSgBcGa7IIv2EbPWxbmywnJNb+R65
	 scfxNqQ9mIrWnqbIMR0ZTadt6mPz1Nh/q948kVXHxiPvLFdqNnO/QLVWq3VSrl1ZTDyKg
	 0atkyIkwD4qsn+AvzHU58abEXHob4iWYHchRVDHgiPxNQxEEodn9nDGr2MCDiZtgOW16y
	 ti4gpfm2Itxbo10HrPSHCSS1+1b8LBi+639F4JsbZAWXtV8cFaE3OB5+5Ne7sDx+/l0FI
	 THFMEiP1R5TwItsFwSOMZ1BM7L635rX8fC8l1wH1JMURcvkqsJUTbvqshO6TC+RmT0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD48606A32C
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD48606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxztBywwNrFR0iAA--.7254S3;
	Mon, 23 Nov 2026 12:39:14 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs9rwwNra8s2AA--.43419S5;
	Mon, 23 Nov 2026 12:39:14 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] LoongArch: BPF: Add support for indirect jumps
Date: Mon, 23 Nov 2026 12:39:06 +0800
Message-ID: <20261123043907.20225-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261123043907.20225-1-yangtiezhu@loongson.cn>
References: <20261123043907.20225-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJCxPs9rwwNra8s2AA--.43419S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFy5ZryxGF4xKF48Zry5GFX_yoWDJFX_tw
	13G34xWw4rWFyrA3WYgayrJFyDCw18XFn0krnFgrW8ua4Ygry5ArWvqas8C3yjgrWYkay5
	X393t3sIyw12qosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

In order to implement JIT support for the indirect jump instruction
(BPF_JMP | BPF_JA | BPF_X), emit a jirl instruction to jump to the
target address held in dst without saving PC+4 into return address.

This is similar to commit f4a66cf1cb14 ("bpf: arm64: Add support for
indirect jumps").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 415b945bf818..52da39dce4f6 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1184,6 +1184,11 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			goto toofar;
 		break;
 
+	/* PC = dst */
+	case BPF_JMP | BPF_JA | BPF_X:
+		emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, dst, 0);
+		break;
+
 	/* PC += off */
 	case BPF_JMP | BPF_JA:
 		jmp_offset = bpf2la_offset(i, off, ctx);
-- 
2.42.0

