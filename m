Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053F22097
	for <loongarch@lists.linux.dev>; Thu,  8 Jan 2026 02:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767839032; cv=none; b=Yt+283CwAzJ98HkbL8tOKMnm+5u2mCKhSFakgA7LJKP0uH+yJvh3trfH99wCUy10IYtFrpmowhC5YigtCfmRHLt83adfESBG4JNUC8l8jUBBiRS4GI+dI6YuMCKmEakwAczD7YhbuJQw1z7+BGctHyPbv0TsYitd04qYG8MDaxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767839032; c=relaxed/simple;
	bh=ZDpPQWr5z3NT2bQ1AQqz7QtzavFPv5XMuiJ4qVKOIms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQ8vKDUqzXC0DVBZhBMWYKhLVfPR2YV1KLFGTlQYVvZsKXgA3XEK3WnCXb4A4SYwMgMbmqyb4Efqk6ZH7cZh09Jo9MYIfnAXs9K9M2j5Y5ACkkM4OxrxSp+nrNCvl9Lr9oT8ZqZC6K4dt1guHt4AXBDirYBRAgv64Jlz8lxRdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REnD8c7W; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REnD8c7W"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fcb465733so30352277b3.3
        for <loongarch@lists.linux.dev>; Wed, 07 Jan 2026 18:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767839029; x=1768443829; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WPMqEgbiq/1nCGoqJgHIPGVbxZP1MvEMarO5Hdi07w=;
        b=REnD8c7WusCIoxYmavSluich/77pDZezzUWiVIGtX5Dr4wNHwzlsF8jtCmn2VTobOX
         yKo2g2K8rzlvqt+UMhYvV56GvRH4pLMvm2DCOL2BZYwS3PmPQsxdISTUkB1KAeW7Ir/4
         WbDJJatfryDlb7y51YY7aXmR8pAVgC3NBl1iKqg+CKheK48V//wz3ZwnTZBGboqbGr8l
         bZaGRIAMmuygi4SX4xHgH/IDuffeidgqHSDXoa971glh5wBQb128ILR/D9XSWMWvnrwX
         WRuN3nFXZgo1D7l7KqXFt/nQsecclACzF3r958SVWe6B2tuC4KIMI+HQTqn8zkx4aQPF
         VZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767839029; x=1768443829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WPMqEgbiq/1nCGoqJgHIPGVbxZP1MvEMarO5Hdi07w=;
        b=sG58jkmsj9pYR0TxRDN75QHQoVAFdS8WslraNnuP6GM060OYv5AgXVjqthzuA+4D3E
         exU+fq9k1EWOhBSn5XPO6awyKgaCPYffseR1TjvzovyaKpeXfZZbYlR6AD/eGufJH9K+
         8KqoEAOj+OdmjITOdu9aFPvMCKkNLD4oVFy+enyvdJOSx7FZn9Cqr9C8J/s38tv8DB7e
         DpwRlmHJYM14EFLRnsqflsZfRecFbNSXjoyCRQmCwD3XFz7HOisVr+oJ4qDDktDYXsbf
         oKrST0Zp8xgsDXr3Is24fPFceLVx8E2vo15Z7JXb0n+U8w9hYJrY5Xia5izD5WXfx1Yz
         I1vw==
X-Forwarded-Encrypted: i=1; AJvYcCXXtxVcvnTaruOfgwHoNfO3I4AymGDGSTGRu+cI4ydFnJEy3a7FEIwk+e+uiPxDnQrZiL0GtY2nnQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9VcSH/Oo635C3osGS55FOwZHTwHYwWuWGzEVNrJwHvnrNkEDY
	xwNd6MV2CteBxJdIlQenJXl2+lJPCp3GIevmZw2y3zW/R69sgxwKC+M+
X-Gm-Gg: AY/fxX5rrhnpST6EUjz6ts9A1AMAoTyEFMfcjqFEGGAgTiLT5t0Ygg16gJPqPXLYLwR
	9+hNeBWVxFQG3EaRBuJV0mSRusR1nxHHC4YvDXp+cTEmT1AWRerKXMI9udHvBAinlLjqs5b55A9
	zvmSlIx8BLeKa4s5N7CxLdHSTXiVsi2CYIzAIh1OWL04jxBRZq0wNjIyiLJl0Eleqr6XW/xFv/S
	CO/guPmqkrai2NED3Pgqs4pmjZBppLpuQTbbneuTyGGF6WqzDVnqEtGzjycRl49zYUd8AA4VDWc
	7PyzjUdntgOeNOeCXf9fJPHdeRC3f6HEh0gVoFbgV/XLNgujatvKfWtXhygiyUg139AWxXSspBs
	ke+QcABb0jBPbdkcT3AyDSU9eFTOYq0Ytu1y8KL9XBOQLneSp0Pb3UjNhvU+f2q5/3feQg74ucu
	+ef8HZxm/SwageZ/Q0T3kW9kE4czSdxLRWFhewVQ==
X-Google-Smtp-Source: AGHT+IGgMpL+kZMdvF4ADTgetvjR8KjnRPwe3Xe2CKlVvJLk69qHA2NQZ4MxPPVQYhnVGWyKjWzQjw==
X-Received: by 2002:a05:690e:1c06:b0:644:6b68:f126 with SMTP id 956f58d0204a3-64716cacb29mr3927712d50.77.1767839028925;
        Wed, 07 Jan 2026 18:23:48 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790ae603282sm21321087b3.13.2026.01.07.18.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 18:23:48 -0800 (PST)
Message-ID: <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Date: Thu, 8 Jan 2026 10:23:19 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
To: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, alexs@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-arch@vger.kernel.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-mm@kvack.org>,
 "open list:C-SKY ARCHITECTURE" <linux-csky@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:OPENRISC ARCHITECTURE" <linux-openrisc@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>
References: <20260107064642.15771-1-alexs@kernel.org>
 <aV4h5vQUNXn5cpMY@kernel.org>
 <080e493a-e4f1-4c97-a3e1-f76f126b5213@gmail.com>
 <aV5yIuGi9Ni5YP5E@casper.infradead.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <aV5yIuGi9Ni5YP5E@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/1/7 22:48, Matthew Wilcox wrote:
> On Wed, Jan 07, 2026 at 05:28:36PM +0800, Alex Shi wrote:
>> Right, I will fix this. and sent the 2nd version.
> No, the patch is stupid and wrong.  Don't send a v2.  You seem to have a
> hairtrigger resend, so I'm trying to prevent a v2 being sent instead of
> sending a patient reply.

Hi Matthew,

I hear you—no v2 will be sent.
but sorry for a bit confusing, what's your expected fix? is the too 
quick resenting? or the direction to alignment pgtable_t with ptdesc is 
wrong?

If it's the first. the new change for review address Mike's concern.
diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
index a17f01235c29..a204c3ac800a 100644
--- a/arch/arm/include/asm/pgalloc.h
+++ b/arch/arm/include/asm/pgalloc.h
@@ -94,13 +94,13 @@ pte_alloc_one_kernel(struct mm_struct *mm)
  static inline pgtable_t
  pte_alloc_one(struct mm_struct *mm)
  {
-       struct page *pte;
+       struct ptdesc *pte;

         pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
         if (!pte)
                 return NULL;
-       if (!PageHighMem(pte))
-               clean_pte_table(page_address(pte));
+       if (!PageHighMem(ptdesc_page(pte)))
+               clean_pte_table(ptdesc_address(pte));
         return pte;
  }

@@ -141,7 +141,7 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, 
pgtable_t ptep)
         else
                 prot = _PAGE_USER_TABLE;

-       __pmd_populate(pmdp, page_to_phys(ptep), prot);
+       __pmd_populate(pmdp, page_to_phys(ptdesc_page(ptep)), prot);
  }

  #endif /* CONFIG_MMU */
