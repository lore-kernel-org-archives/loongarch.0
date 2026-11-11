Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390748;
	b=orMKbUK3htSlw6gRmmW/CJJSeAsjO1LCuGPuCO923WRqfgVyuYq8XzRW2sgUlDfVmZTk
	 KSTbXgtj/iUyHBSsWkPLhtI5s0UkdB1eJkXJ9pwuUCLfQuTfKT93Gpdu2usbfCCfzh+J9
	 r3l18gcCVOdYgfYNeAfsCS7axteCNa8Z+lnTNaHDh42OMN40u26uzlhitH6AinDqS3V2K
	 CFRMy/AGP4Bq8ptSoGrYvyHkJOlzcDO4uTpSwwfHBwuEw+ciB29Qu5wrER83mNdIqvSiG
	 xXhacv0UesJYLu6xcPMAzaOGZR/A19+HpDobT6NvSDaxgJkKfDvwYxdeuu8MSsfoRlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390748;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=rKjspfH/rKh5u+ezX8DhTrlI7niVp5pQK4NpR7IycPc=;
	b=otHJurPh8xAecVee5rmiufkoMMp3lrprT1+R2vYrZffclKHuIwTXwaCkkgpKWmSHzzrf
	 xK9BDxIfADEEq3lfafE24InbMwhqS8YVOqZNSgcKMAiwfRcRw9gEdITbOLNpPlxwGzWkH
	 pJoOPr9R0H53ydJc5MaEnvjK71s9ElpVI7n778s+xEKBIlRlcvhfl2XuwqP0Uqxa+/768
	 cw17POQ7QFaZfAioN4XBSLm1CCOLZeWfrQzV7jtOtazWUZuq27oKxDLfJ/0y9CG2bF6El
	 eHw/P3Ri2Xu3dZfvjsKuo5ak4VKZdzC3yQNlVgar0d4T2OsyOjaeoQr0H0SN7w9a+pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49776606A33E
	for <loongarch@lists.linux.dev>; Wed, 11 Nov 2026 09:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49776606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Bxb9PZOvRqX4EeAA--.22220S3;
	Wed, 11 Nov 2026 17:52:25 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zSOvRqrLMzAA--.12000S3;
	Wed, 11 Nov 2026 17:52:22 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] LoongArch: BPF: Add support for instructions array
Date: Wed, 11 Nov 2026 17:52:15 +0800
Message-ID: <20261111095217.31415-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxg8zSOvRqrLMzAA--.12000S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF4kZFWfAFy3JFyrGFykJFc_yoWkZFcEqa
	4xXasrW3WrGr18Jw1j9rWfXF4jk34rWFn5uryxWrWkZ3s8Aw45urZ7t3s2k3yUWrW7Ja1S
	krZrJas0vw4IvosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY38nUUUUU=

Add support for the instructions array map type in the LoongArch
JIT by calling bpf_prog_update_insn_ptrs() with the offsets that
map xlated_offset to the jited_offset in the final image.

LoongArch JIT already has this offset array which was being used
for bpf_prog_fill_jited_linfo() and can be used directly for the
function bpf_prog_update_insn_ptrs().

This is similar to commit 84b1c40d5b4d ("bpf: arm64: Add support
for instructions array").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index d7ea515045ec..26904010d9b5 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -2393,6 +2393,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 		for (i = 0; i <= prog->len; i++)
 			ctx.offset[i] *= LOONGARCH_INSN_SIZE;
 		bpf_prog_fill_jited_linfo(prog, ctx.offset + 1);
+		bpf_prog_update_insn_ptrs(prog, ctx.offset, ctx.ro_image);
 
 out_offset:
 		kvfree(ctx.offset);
-- 
2.42.0

