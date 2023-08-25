Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2B621
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 01:30:57 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a3e271491so383447b3a.0
        for <loongarch@lists.linux.dev>; Thu, 24 Aug 2023 18:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692927057; x=1693531857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7ELdHtTL5wYh7Mk37fDEn5rWUjAm0EdSJQg/6HWPPQ=;
        b=Tmlz4s2OgK58rZBzZOqQBOTKsewJsSbr0lEcw148TWgipwzPC4h3leu6DHGlT2r85/
         Uip0aLw7OTRJ61MyT/fB+2M0fG4g6LWvilyhBIrARSkzuGacd0puWelGLD8sQFEorTQR
         iWM9dveRRwtXAAMgsQ1/wPN9YLRbtznx8UH3GB/Gc6Kl2jKJWnRhPY+VLZrWbWEKV9yS
         nafEaqYDFpVR5/DPJmFBDt9xOQCxtCGGHTqymDFSbzyjxleu1nAu7M/vlGloF4CFWAV1
         1Mn9tQCCGOF3Z8ZylRnT1zAlhIOy4YB5/0u2bxeQjx03+CoamjdoA+ECCtWPkVPf8KF0
         7rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692927057; x=1693531857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7ELdHtTL5wYh7Mk37fDEn5rWUjAm0EdSJQg/6HWPPQ=;
        b=MYyTL+03wqZbvqkFbFeM+mc+ceslHXnidHF3RaKqefTqxBbWP6Ra92CKX8KxLBZgaU
         FZDjOuF+CJIrejLM8q76KnGVPZZH/XoG7dHiOvag101OBjRQyPbOMPF8t8cW5FV+QbbD
         lIVPXYl4lWZIj0idpvU04UGdb0AVCWJ/qzY2Ja9YuozcNxT3anBoM5qLiqzfqY/EkJ3N
         iawRkOmR2vzfjWBKfBzViCld9gjrG1XGm88WpndAP0QdPPdgiVNGk4O8G94KYKr3VmA8
         Dm0wJ3H/8GbTFaF5bHCkXjbZw2xb+11kkmjtlfxcYTAvmtlJl0GAUe5/Vg+C2qcAk/W3
         eDKA==
X-Gm-Message-State: AOJu0Yyye3apBNl9XfcvXvCaK9TzbYXQ/LCa2Uv13NWjaX+QgEhRQx6p
	UhM+g0CCC50EHg4WIUp93Fk=
X-Google-Smtp-Source: AGHT+IGkdO3IAVMt9b8NA6cgzJYFAF5G39z8+OmHSySwOLhyKezYRWYjT2VqAbDb9GTS6Db8Rjs5TA==
X-Received: by 2002:a05:6a00:1a13:b0:68a:49bc:9be3 with SMTP id g19-20020a056a001a1300b0068a49bc9be3mr14483212pfv.29.1692927057420;
        Thu, 24 Aug 2023 18:30:57 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cd10:2fec:7ce0:fe0a? ([2001:df0:0:200c:cd10:2fec:7ce0:fe0a])
        by smtp.gmail.com with ESMTPSA id y19-20020aa78553000000b00682af93093dsm367550pfn.45.2023.08.24.18.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 18:30:57 -0700 (PDT)
Message-ID: <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
Date: Fri, 25 Aug 2023 13:30:32 +1200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
Content-Language: en-US
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Richard Weinberger <richard@nod.at>, Bjorn Helgaas <bhelgaas@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20230810141947.1236730-1-arnd@kernel.org>
 <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin, Arnd,

On 25/08/23 13:12, Martin K. Petersen wrote:
> On Thu, 10 Aug 2023 16:19:18 +0200, Arnd Bergmann wrote:
>
>> Most of the patches I sent so far for the -Wmissing-prototype warnings
>> have made it into linux-next now. There are a few that I'm resending
>> now as nobody has picked them up, and then a number of fixes that I
>> found while test-building across all architectures rather than just the
>> ones I usually test.
>>
>> The first 15 patches in this series should be uncontroversial, so
>> I expect that either a subsystem maintainer or Andrew Morton can
>> apply these directly.
>>
>> [...]
> Applied to 6.6/scsi-queue, thanks!
>
> [07/17] scsi: qlogicpti: mark qlogicpti_info() static
>          https://git.kernel.org/mkp/scsi/c/71cc486335c4
> [11/17] scsi: gvp11: remove unused gvp11_setup() function
>          https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb

I somehow missed that one ...

The gvp11_setup() function was probably a relic from the times before 
module parameters.

Since gvp11_xfer_mask appears to be required for some Amiga systems to 
set the DMA mask, I'd best send a patch to add such a module parameter ...

Do you know any details around the use of DMA masks for Amiga WD33C93 
drivers, Geert?

Cheers,

     Michael


>
