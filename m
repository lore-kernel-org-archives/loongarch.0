Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9E8366
	for <loongarch@lists.linux.dev>; Fri, 16 Dec 2022 03:18:54 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Dx9vCc45tjagMGAA--.13632S3;
	Fri, 16 Dec 2022 11:18:52 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxg+WY45tjChsBAA--.5803S3;
	Fri, 16 Dec 2022 11:18:50 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Correct the definition of is_branch_ins()
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1671006659-23859-1-git-send-email-yangtiezhu@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <e89c80c7-53e5-5fec-d66b-4b375aa85d10@loongson.cn>
Date: Fri, 16 Dec 2022 11:18:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1671006659-23859-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Cxg+WY45tjChsBAA--.5803S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7CFW8tr1UWr18ZrWxWr15Arb_yoW8CrWkpF
	9xAFs5GF4kKFZakrnxJa18uF1Fvws3Kr4xXF1a9r1rCwnFqw1qyF18Jw1qyF1vkw4xKr1I
	qr4fJ3WjgF47A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU83UUUUUUUU==

Hi, Tiezhu,


On 2022-12-14 16:30, Tiezhu Yang wrote:
> The current definition of is_branch_ins() is not correct,

But the branch instruction opcode only use the high 6 bits, [1]. That's 
meaningless because it is the same as the original result. If we care 
too much about the details of instruction format, we will lose a lot of 
tricks on LoongArch instruction coding.

[1] 
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#table-of-instruction-encoding


> it was
> first introduced in commit 49aef111e2da ("LoongArch: Add prologue
> unwinder support"), in fact, there exist three branch instruction
> formats rather than only reg1i21_format.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/include/asm/inst.h | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
> index c00e151..42be39be 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -329,8 +329,31 @@ static inline bool is_pc_ins(union loongarch_instruction *ip)
>   
>   static inline bool is_branch_ins(union loongarch_instruction *ip)
>   {
> -	return ip->reg1i21_format.opcode >= beqz_op &&
> -		ip->reg1i21_format.opcode <= bgeu_op;
> +	switch (ip->reg0i26_format.opcode) {
> +	case b_op:
> +	case bl_op:
> +		return true;
> +	}
> +
> +	switch (ip->reg1i21_format.opcode) {
> +	case beqz_op:
> +	case bnez_op:
> +	case bceqz_op:
> +		return true;
> +	}
> +
> +	switch (ip->reg2i16_format.opcode) {
> +	case jirl_op:
> +	case beq_op:
> +	case bne_op:
> +	case blt_op:
> +	case bge_op:
> +	case bltu_op:
> +	case bgeu_op:
> +		return true;
> +	}
> +
> +	return false;
>   }
>   
>   static inline bool is_ra_save_ins(union loongarch_instruction *ip)

