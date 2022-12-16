Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF377371
	for <loongarch@lists.linux.dev>; Fri, 16 Dec 2022 06:11:06 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxdPD3C5xjCgkGAA--.14138S3;
	Fri, 16 Dec 2022 14:11:04 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxf+T3C5xjiTkBAA--.5397S3;
	Fri, 16 Dec 2022 14:11:03 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Correct the definition of is_branch_ins()
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
References: <1671006659-23859-1-git-send-email-yangtiezhu@loongson.cn>
 <e89c80c7-53e5-5fec-d66b-4b375aa85d10@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e65ce2d5-a154-6912-ab01-b0dc158acaaa@loongson.cn>
Date: Fri, 16 Dec 2022 14:11:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e89c80c7-53e5-5fec-d66b-4b375aa85d10@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cxf+T3C5xjiTkBAA--.5397S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Wr15urW7Xw4UZr4xWF4fAFb_yoWkZwc_ua
	47Ww48Cw4rJ39rA3WkKw1ftrWUGa18Jan5Ary8tFW7GFn8tw1DA3yUtwnxZwn8Kw4kArs8
	uF95tr1rCr12gjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	W7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
	CTnIWIevJa73UjIFyTuYvjxU2L05UUUUU



On 12/16/2022 11:18 AM, Jinyang He wrote:
> Hi, Tiezhu,
>
>
> On 2022-12-14 16:30, Tiezhu Yang wrote:
>> The current definition of is_branch_ins() is not correct,
>
> But the branch instruction opcode only use the high 6 bits,

Yes, I noticed that, the logic result of current code is right,
but it seems a little strange (only consider reg1i21_format)
at the first glance, the initial aim of this patch is to make
it theoretically correct, maybe it is not the best change.

I think we can neglect the instruction formats and check the
high 6 bits instead, what do you think of the following change?

diff --git a/arch/loongarch/include/asm/inst.h 
b/arch/loongarch/include/asm/inst.h
index c00e151..fd31752 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -329,8 +329,8 @@ static inline bool is_pc_ins(union 
loongarch_instruction *ip)

  static inline bool is_branch_ins(union loongarch_instruction *ip)
  {
-       return ip->reg1i21_format.opcode >= beqz_op &&
-               ip->reg1i21_format.opcode <= bgeu_op;
+       return ((ip->word >> 26) & 0x3f) >= beqz_op &&
+               ((ip->word >> 26) & 0x3f) <= bgeu_op;
  }

Thanks,
Tiezhu



