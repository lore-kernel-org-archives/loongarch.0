Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F2F7C
	for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 01:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1661823748; bh=58NYac2VN6bAtPqhMxaL7OUy/f09kLyZxGEBfpCP8Pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dhnnHxB41JmaLmFWVDb9H/AcsuXykMH6m1vgqHVMU+AX+m7r9H8LLVDmIO8toAGmi
	 WEtcX/7xf8MbUxgjkd9ZqBRrTfD1VTutzc64xMgnmf+QBW7d2QLYfhOcgXx50beoDU
	 mSYdyLY2uTo09URLkuZnaTePH/jdJKrCxV7Pe378=
Received: from [100.100.57.219] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E3664600D1;
	Tue, 30 Aug 2022 09:42:27 +0800 (CST)
Message-ID: <4033aec9-8df5-53ae-59e1-9ec3ade5f6d7@xen0n.name>
Date: Tue, 30 Aug 2022 09:42:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:106.0)
 Gecko/20100101 Thunderbird/106.0a1
Subject: Re: [PATCH v6 5/6] LoongArch: Support PC-relative relocations in
 modules
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Youling Tang <tangyouling@loongson.cn>, Jinyang He <hejinyang@loongson.cn>
References: <20220829133146.15236-1-xry111@xry111.site>
 <20220829133146.15236-6-xry111@xry111.site>
 <CAAhV-H77jQvcJL=LF0dknd7EjiWYMZL3ZRMM1drsGkO33UM_Jg@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H77jQvcJL=LF0dknd7EjiWYMZL3ZRMM1drsGkO33UM_Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/8/29 23:08, Huacai Chen wrote:
> [snip]
>> +static int apply_r_larch_pcala(struct module *mod, u32 *location, Elf_Addr v,
>> +                       s64 *rela_stack, size_t *rela_stack_top, unsigned int type)
>> +{
>> +       union loongarch_instruction *insn = (union loongarch_instruction *)location;
>> +       /* Use s32 for a sign-extension deliberately. */
>> +       s32 offset_hi20 = (void *)((v + 0x800) & ~0xfff) -
>> +               (void *)((Elf_Addr)location & ~0xfff);
>> +       Elf_Addr anchor = (((Elf_Addr)location) & ~0xfff) + offset_hi20;
>> +       ptrdiff_t offset_rem = (void *)v - (void *)anchor;
>> +
>> +       switch (type) {
>> +       case R_LARCH_PCALA_HI20:
>> +               v = offset_hi20 >> 12;
>> +               break;
>> +       case R_LARCH_PCALA64_LO20:
>> +               v = offset_rem >> 32;
>> +               break;
>> +       case R_LARCH_PCALA64_HI12:
>> +               v = offset_rem >> 52;
>> +               break;
>> +       default:
>> +               /* Do nothing. */
>> +       }
>> +
>> +       switch (type) {
>> +       case R_LARCH_PCALA_HI20:
>> +       case R_LARCH_PCALA64_LO20:
>> +               insn->reg1i20_format.immediate = v & 0xfffff;
>> +               break;
>> +       case R_LARCH_PCALA_LO12:
>> +       case R_LARCH_PCALA64_HI12:
>> +               insn->reg2i12_format.immediate = v & 0xfff;
>> +               break;
>> +       default:
>> +               pr_err("%s: Unsupport relocation type %u\n", mod->name, type);
>> +               return -EINVAL;
>> +       }
> Can we merge the two switch here?

IMO leaving as-is or even splitting into two functions would be 
acceptable, as the two switches are performing two different things -- 
namely "adjustFixupValue" (in LLVM-speak) and actually inserting the 
value into the insn word. But an argument for merging the two can be 
made too, because the v2.00 reloc types are purposely designed with 
unique use case for each, meaning there is actually no flexibility in 
between the fixup value's calculation and application. So I think this 
eventually comes down to coder's preference?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

