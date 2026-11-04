Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804214;
	b=BN/6Q28YdQ9/EyoBkUK6rg4o2EI+rbNZr7VbB/ygQgj0rBcUkr7ixjFiDEjExBnebizq
	 dRbPD241XJrNcT77v3dahVBA3xurbwtAnpHni+oJfLvgSomRRDjzDF7yDs58U3oJipx1U
	 vmRL9YjxQvMAX3y8oyGHSUsHJ2f3/B9siv3s2Uz35qYphrb/3zdLSMhgXJur915QQp3lN
	 ijefrcRBoQeJIhhrmt47Fxtf3ZZ4HjgVvURVg6RzPDGYjK3WHC+TrS3Db8tJXTx0qYKvX
	 HaG0cXthWIWnStwKs3U6SNF7S0bOS8KsXbZJbmX/7T0nvkC38zWTGRiluUXv088OWvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804214;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=T7rOMPplLomFK+EC05LzdPzGrXETZLxt3EvKKKVvcv0=;
	b=f+JPZUojzs1Nppa/l9wV0QpII8GxxBXyko4IS53hd6VKbfAJLz67pvIkWYSpXTZjGFxL
	 uAYedNlN7vdFoyXU8Px6PZ/L1VVMGe/FX3n5fo3tXvQWlepQVkwl70RrKKotu9K6UvbR8
	 7weeMvpLicDk6zyWN7fbaHrvStqaS7P5zBUgJ130pIxoPsdlCNRy8AtwADboJSWDQJRZA
	 BNr+mUk8fJ8MgIdp5JogpcpMxslHOUOzQ5WWKIgMzb+9+Ls4C8mghFjoz6Uipq4vOstdM
	 HQ4Fn4mBAzfuKyHsQ+E4TCO8pRSL8QUKuj9IGkgk7WxQh//PJRtC5O8nPEiH8ftiVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrptcyWU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEFF606A330;
	Wed,  4 Nov 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrptcyWU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CC11F000C1;
	Wed,  4 Nov 2026 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804214;
	bh=T7rOMPplLomFK+EC05LzdPzGrXETZLxt3EvKKKVvcv0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=MrptcyWUAcszN49zHQTkn3Vlr/HscV8Bl4lEC7R76+MYv7gQJXdxpylZ79fGVxJJG
	 9g2RjZrokNB6qDNHG67TRkFttmgL1t2KdGdPIq0zjGZQ2tpCDDyqj1gOxcwehdfXY+
	 WNHZuIs47sffQbdvvDUJo0zkxJB0m5g+Zo5ngvZRNdtigj8ZxmrYguaza/nDk0M3CY
	 G5c7zitroMfYhwxfXt68GtCd4yiMACIrJ5qsb2puVDshMKSWVxOz6W6kzvD8gW2gAO
	 +MF/8nKz3uZpWHQ8FC5h0nznRoxul5JcWwA09pW2w+j3axirgz6HMdNa1MuyG7qGfV
	 qv8X6UKrIz32Q==
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 00/15] kexec: Fix CMA and elf header leaks and
 rework
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
 chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
 ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, thuth@redhat.com, 
 leitao@debian.org, yeoreum.yun@arm.com, robh@kernel.org, 
 sourabhjain@linux.ibm.com, kees@kernel.org, coiby.xu@gmail.com, 
 Yeking@Red54.com, tangyouling@kylinos.cn, maqianga@uniontech.com, 
 zhangtianyang@loongson.cn, guodongtai@kylinos.cn, blum@kernel.org, 
 adityag@linux.ibm.com, hui.wang@canonical.com, sohammetha01@gmail.com, 
 guoren@kernel.org, gaohan@iscas.ac.cn, kai.huang@intel.com, kas@kernel.org, 
 vishal.l.verma@intel.com, piliu@redhat.com, jbouron@amazon.com, 
 mclapinski@google.com, me@linux.beauty, graf@amazon.com, bgwin@google.com, 
 x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org
In-Reply-To: <20261026075201.699550-1-ruanjinjie@huawei.com>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
Date: Wed, 04 Nov 2026 16:56:37 +0200
Message-Id: <179380419709.28814.2122135856184991710.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi Jinjie,

> ARM64, LoongArch and RISC-V load the elf core header, initrd, DTB
> and cmdline parameters with almost identical code. This series fixes
> the bugs in that path. And as Mike suggested, rework the common part
> into a helper.
> 
> Patch 1 stops using the Image text_offset for arm64, which breaks CMA
> segments in both the load and release paths, and rejects images with
> a non-zero value.
> 
> Patches 2-7 fix the CMA page and elf core header leaks in the retry
> loops in arm64 and LoongArch, also fix a modified_cmdline leak
> in LoongArch.

These mix fixes that can be easily merged via arch trees and something
that depends on a change to the generic kexec code.

Besides, elf_headers leak and arm64's text_offset fixes should be
applied to most if not all stable kernels, while CMA fixes are only for
the relatively new kernels.

I'd suggest splitting

	arm64: kexec_file: Stop using the Image text_offset
	arm64: kexec_file: Fix elf_headers memory leak in retry loop

and sending as pure arm64 material, and


	LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
	LoongArch: kexec_file: Fix a modified_cmdline leak

as pure LoongArch material.

And then working on CMA fixes after these land.

If there are real dependencies or potential conflicts, b4 prep can help
you with managing them.

> Patches 8-10 pass the kbuf fields to crash_prepare_headers() to
> simplfy code.
> 
> Patch 11 frees the elf core header from the generic post-load cleanup.
> 
> Patches 12-15 add kexec_load_other_segments() and convert the three
> architectures, and arch_kexec_setup_other_segments() builds
> the architecture specific boot parameters (a DTB or a command line).

I think the refactoring should go before the identical fixes in arch/
code.

-- 
Sincerely yours,
Mike.

