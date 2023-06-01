Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1710FA
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 23:54:50 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-39a3f165ac5so1236796b6e.3
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 16:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685663690; x=1688255690;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq+xoVGoOBMASX6Qo6F/Chq5PaVghrBgpVyIfFrv3Do=;
        b=hQ0RCKA9jRCKnGCyO2kN3QTLC3yb+Mdefo52tmuodc7Rt84YU9NlyduoNwqz+Q967d
         V7uBGj6VWFgr8YM6btVxO0XdtNVoooAp04klqJfE2ZmBUTlaUrv5ESo1tluojxtb/P0b
         IXsvFxgfg/85GYZ9MIdxPzQ2yHr/de4bqkKek71QIfTGQZKS+sL+6FNopqB/1pl5gZdM
         9SlKfIAzGLZNhvxUgWL+XEi7FhwDSsySWQZgNcWM1R6l7k6VA58bq3RnIGKXMDknOFde
         ITMFH1EZ3IUbIVWsPaSYfWLIZRF8wgeqkPJHfjZqlj6I94YsQOh8SKgp5f7sF92n6NGq
         pQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685663690; x=1688255690;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq+xoVGoOBMASX6Qo6F/Chq5PaVghrBgpVyIfFrv3Do=;
        b=jtVZbgc9fuC6TWKSMtABGsH5JVMnRPco8kdvtQKzA/dsorPHaFkFLxPH0P3HR73Vxj
         2sxM2ibelpj5ZhaT9mYEpIdXaSyzTBO6mrFYY8zB9jhoBc2lstXHm66aXmnqBZ8K1ubK
         oDXYKysEM7SZhdI58d0pFyi56igEMiNOu25KU6RXWCaz5CGqr7fenzWwFTFjeaAstnNN
         SxCRvI5RbSmpaNBltJhreA3G5PM6V1v9v473QuaOIoHFeZUPgp2bl6WllgDdnkCKOwob
         I8J8Xq06r1REgn2tpKrE6WnPg8z4TyWLanAV34EDp6DPbXUGtPoIQR9E+9JWFhGzWAst
         ai2w==
X-Gm-Message-State: AC+VfDygOxNCTQ0+zTWWFVs3M9x5yOs4FJvNVL0mSaGYxmvFJ4LTcaA1
	2lGV0skgVjM6VCbJ4RSxiGk=
X-Google-Smtp-Source: ACHHUZ6FGoT9AAhqdl4GKiokh7jtAU2ufEnyUr4RvYWwArHNvXyiDuy+wWqdSoxg1oPDBs7mS6RMxw==
X-Received: by 2002:a54:4604:0:b0:399:55c9:6f20 with SMTP id p4-20020a544604000000b0039955c96f20mr610729oip.52.1685663689890;
        Thu, 01 Jun 2023 16:54:49 -0700 (PDT)
Received: from smtpclient.apple ([66.170.99.95])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b001aafa2e212esm4074977pld.52.2023.06.01.16.54.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Jun 2023 16:54:49 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
Date: Thu, 1 Jun 2023 16:54:36 -0700
Cc: "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
 Thomas Gleixner <tglx@linutronix.de>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "x86@kernel.org" <x86@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Will Deacon <will@kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "song@kernel.org" <song@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
 <0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
 <ZHjcr26YskTm+0EF@moria.home.lan>
 <a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
 <ZHjljJfQjhVV/jNS@moria.home.lan>
 <68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
X-Mailer: Apple Mail (2.3731.600.7)



> On Jun 1, 2023, at 1:50 PM, Edgecombe, Rick P =
<rick.p.edgecombe@intel.com> wrote:
>=20
> On Thu, 2023-06-01 at 14:38 -0400, Kent Overstreet wrote:
>> On Thu, Jun 01, 2023 at 06:13:44PM +0000, Edgecombe, Rick P wrote:
>>>> text_poke() _does_ create a separate RW mapping.
>>>=20
>>> Sorry, I meant a separate RW allocation.
>>=20
>> Ah yes, that makes sense
>>=20
>>=20
>>>=20
>>>>=20
>>>> The thing that sucks about text_poke() is that it always does a
>>>> full
>>>> TLB
>>>> flush, and AFAICT that's not remotely needed. What it really
>>>> wants to
>>>> be
>>>> doing is conceptually just
>>>>=20
>>>> kmap_local()
>>>> mempcy()
>>>> kunmap_loca()
>>>> flush_icache();
>>>>=20
>>>> ...except that kmap_local() won't actually create a new mapping
>>>> on
>>>> non-highmem architectures, so text_poke() open codes it.
>>>=20
>>> Text poke creates only a local CPU RW mapping. It's more secure
>>> because
>>> other threads can't write to it.
>>=20
>> *nod*, same as kmap_local
>=20
> It's only used and flushed locally, but it is accessible to all CPU's,
> right?
>=20
>>=20
>>> It also only needs to flush the local core when it's done since
>>> it's
>>> not using a shared MM.
>> =20
>> Ahh! Thanks for that; perhaps the comment in text_poke() about IPIs
>> could be a bit clearer.
>>=20
>> What is it (if anything) you don't like about text_poke() then? It
>> looks
>> like it's doing broadly similar things to kmap_local(), so should be
>> in the same ballpark from a performance POV?
>=20
> The way text_poke() is used here, it is creating a new writable alias
> and flushing it for *each* write to the module (like for each write of
> an individual relocation, etc). I was just thinking it might warrant
> some batching or something.

I am not advocating to do so, but if you want to have many efficient
writes, perhaps you can just disable CR0.WP. Just saying that if you
are about to write all over the memory, text_poke() does not provide
too much security for the poking thread.

