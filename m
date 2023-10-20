Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEB41804D
	for <loongarch@lists.linux.dev>; Fri, 20 Oct 2023 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxbev1XDJlaXQzAA--.31929S3;
	Fri, 20 Oct 2023 18:56:53 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxri_0XDJlUkMsAA--.27445S3;
	Fri, 20 Oct 2023 18:56:52 +0800 (CST)
Subject: Re: [PATCH v3 5/8] objtool: Check local label about sibling call
To: Peter Zijlstra <peterz@infradead.org>
References: <1697768821-22931-1-git-send-email-yangtiezhu@loongson.cn>
 <1697768821-22931-6-git-send-email-yangtiezhu@loongson.cn>
 <20231020093031.GB31411@noisy.programming.kicks-ass.net>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f8f6b51c-6e0d-baf2-788e-bc3d175d21f2@loongson.cn>
Date: Fri, 20 Oct 2023 18:56:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231020093031.GB31411@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cxri_0XDJlUkMsAA--.27445S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw48CF1kAw18urWktr4DJrc_yoW8GrW8pF
	4UC3y2kFW2qryfXw17tF1UWrZ8Ww47WryIkF17JFW0yr42qFnxGr4fCr1YyF1vqw45ua42
	9FyYgr18Jr4FvrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
	1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8jZX5UUUUU==



On 10/20/2023 05:30 PM, Peter Zijlstra wrote:
> On Fri, Oct 20, 2023 at 10:26:58AM +0800, Tiezhu Yang wrote:
>
>> +		if (reloc && reloc->sym->type == STT_NOTYPE &&
>> +		    strncmp(reloc->sym->name, ".L", 2) == 0)
>
>> +			if (reloc->sym->type == STT_NOTYPE &&
>> +			    strncmp(reloc->sym->name, ".L", 2) == 0) {
>
> Would not something like the below be better?
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index e308d1ba664e..a57d293c834d 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2506,6 +2506,9 @@ static int classify_symbols(struct objtool_file *file)
>  	struct symbol *func;
>
>  	for_each_sym(file, func) {
> +		if (func->type == STT_NOTYPE && strstarts(func->name, ".L"))
> +			func->local_label = true;
> +
>  		if (func->bind != STB_GLOBAL)
>  			continue;
>
> diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
> index 9f71e988eca4..2b8a69de4db8 100644
> --- a/tools/objtool/include/objtool/elf.h
> +++ b/tools/objtool/include/objtool/elf.h
> @@ -67,6 +67,7 @@ struct symbol {
>  	u8 profiling_func    : 1;
>  	u8 warned	     : 1;
>  	u8 embedded_insn     : 1;
> +	u8 local_label       : 1;
>  	struct list_head pv_target;
>  	struct reloc *relocs;
>  };
>

Yes, this looks much better, thank you very much.
I will update the related code of patch #5, #6 and #7.

Thanks,
Tiezhu

