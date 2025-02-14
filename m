Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F69A22A7E3;
	Fri, 14 Feb 2025 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523411; cv=none; b=AgjbkNiv8zm9ICU+FbzigrSKWKcohv+UZT2z7016xpTq/ckXZaW4P1wNAsM/M7N199/Xzl3dX6ttS4Nfo4JPEjPVtw/oC3jJFQFLSn9bjpSBF8a0Vg3XNsfxg3nAHaT4Pp+5PS42e7wxnmWcCALgW7kDTVti94gcypxPuhR7Xn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523411; c=relaxed/simple;
	bh=BS5VTSANEuMoikRIGcCI8M1TbLeytLcfc+uSnp/pT58=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FN12T/U+GtptkiMUCbS1yh/O4niLZ+/nxiA3lFBumVFuHQlri2X04FCBe3kPVK5qzDjczFmK9mYfMGA3yPKM/zdzbssm0H17/34RZ7M205AwKAvpzdCz8pNt++6k7+LnUEKBWjeRG/vZrvwnBZn0IfEHjmzzJu1GPwdnlnFg+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxbKxJBa9n_DN1AA--.7017S3;
	Fri, 14 Feb 2025 16:56:41 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MRGBa9nmNARAA--.835S3;
	Fri, 14 Feb 2025 16:56:39 +0800 (CST)
Subject: Re: [PATCH] compiler.h: Specify correct attribute for
 .rodata..c_jump_table
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20240924062710.1243-1-yangtiezhu@loongson.cn>
 <20250212175023.rsxsw7pno57gsxps@jpoimboe>
 <b1e5e3ea-be4b-5dae-cc0d-34693429d060@loongson.cn>
 <20250213023936.lzbpgou4eallaij3@jpoimboe>
 <045d7e22-672c-b9da-38d6-8897e854f262@loongson.cn>
 <20250213185408.m5aogf2trvhvi2td@jpoimboe>
 <439175dc-caf0-3d38-89ba-ade5a364c9bb@loongson.cn>
 <20250214084415.yrffvbop2f6z3du3@jpoimboe>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 llvm@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f4f6d6ef-28cd-922d-fa24-6dd451b44607@loongson.cn>
Date: Fri, 14 Feb 2025 16:56:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250214084415.yrffvbop2f6z3du3@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBx3MRGBa9nmNARAA--.835S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFWxXw4UJry7GF15JF1UJwc_yoW8Jw48pa
	nrA3s3Kr4UXF93tanFq3WjgrW7J347tr92qFy3KrykArsFqryFkr4fAayjva47XwnxKFWI
	qF4Sqw4rZF4DZ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

On 02/14/2025 04:44 PM, Josh Poimboeuf wrote:
> On Fri, Feb 14, 2025 at 10:23:08AM +0800, Tiezhu Yang wrote:
>> I have a draft diff, I will do more test and send it
>> as a formal patch once the other patches are landed
>> because this patch depends on them.
>
> Actually since this is a bug fix, I'm thinking it should be merged in
> the tip/objtool/urgent branch so it can go in an -rc.  Then it should be
> trivial for me to rebase your patches on top.

OK, I will send a patch based on tip/objtool/urgent branch ASAP.

>> The code looks something like this:
>
> Looks good to me.  nit: loongarch can use the C_JUMP_TABLE_SECTION
> define.

Yes, thank you, hope you can amend it when applying my original patch,
maybe like this:

diff --git a/tools/objtool/arch/loongarch/special.c 
b/tools/objtool/arch/loongarch/special.c
index 27c6473608f3..e39f86d97002 100644
--- a/tools/objtool/arch/loongarch/special.c
+++ b/tools/objtool/arch/loongarch/special.c
@@ -131,7 +131,7 @@ static struct reloc 
*find_reloc_of_rodata_c_jump_table(struct section *sec,
                 if (reloc_offset(reloc) > offset)
                         break;

-               if (!strncmp(reloc->sym->sec->name, 
".rodata..c_jump_table", 21)) {
+               if (!strcmp(reloc->sym->sec->name, C_JUMP_TABLE_SECTION)) {
                         *table_size = 0;
                         return reloc;
                 }

Thanks,
Tiezhu

