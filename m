Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D920C38C2C3
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043414; cv=none; b=YRGCHdDMa5vWoB/WiuftpPFj80p48zJO3ToOVGpBelNbybr8W7nlk0IxQbkUTEc+7rpPWj1y4BStUuSLqa0Zg1rd7w9/qIAcJK/BpMj0fhsWSa8mr1oZafYPMnWil7kDkrkoikFnlAKqRJG4/gmpU+HuRSkuqO6Y7Zks+pz8xCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043414; c=relaxed/simple;
	bh=8Q0ze4ZDX2GHsiZDFfKXC9i9aMSp57Cl9GGwUJvpLkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtwZDBxc9d72kI1ZvhgvOqkr5H5Z9eRARYcLLAHjR22z8n/qW0NRbXJvIEkQMVPqjfxeasD3DuCBz7/4eCSHcvxj86bTKcBykdAFXDNvonFk3FGdY32vkzgIU2d9Qc0Gl6r1alVOKxk4v8CjjW+Bf/q4q/qcAGNcnZym+kot2PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KuprNheU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KuprNheU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843e397f74so590553f8f.1
        for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789043406; x=1789648206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARPEqhavuvd4sEo+R5C4AUtofUWM0B/7wgknn65mA9s=;
        b=KuprNheUGyAX6Uk8pNcnaJduw4RRmD6B2Ku4kCxAv7K8hptYxFy9GYcgVVVnS3Pvdk
         DOoeD+64qU82hrI0eY+QHSVngVlRVcbEzB7d4vsw47TUvPLIV2eC/8qHpzPnHsr7XHPU
         bza/ECVkNhLm3/Sr3LWMmCx6PofYXlbvEasZqeaPws/W933Mv8TcmCrcNZELEaZfJB08
         N6o0fsX2U7TW4gkFMgzw4dFClqMPf2Gtij4r7gsY/j7i5SH+NKDPBTvmPyj05j4SkXW0
         6YN34nh9Jr6MFNdrg0u1ZdD6JMVmfOu5UJh9caqPhszaaLVC0+FNuFEncN/sucw4u92X
         cVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043406; x=1789648206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARPEqhavuvd4sEo+R5C4AUtofUWM0B/7wgknn65mA9s=;
        b=FsQd6iyJXTxwIucC+bQNDX57Vsvyv+5/voIIeL9vkmwj6mjTBJ8nbLw7rVee9VnI3Y
         m6XVkBWwUX/pZ9VVistjsSpIF/jwJIk6uChz9bacHTqd28I0TLGMtgrqgl7n/FrK0S1s
         vRBQ4ZK1oVoAAtHcSyDK+UiRHelKXhbSZaCBZD2V12OOAI9wEkcU8fjjZK1wk6Q4F+di
         I36BcXUgmWzk/jv1tlFNcmUoQtHxMRG3k1tRtVUks1uyL4NxKthrAI7G7i3PoTbPvGLF
         L3oywgIx+EJZnv8dzJzB256RSqQd6WJtxmKGdWSV1FC3WIWjMW8LjKw0L9uyZbG4oVIe
         HVTw==
X-Forwarded-Encrypted: i=1; AKwUvBz1tOqmDKqKPZuSv1e6sj7bWd8V8YhZ3Ync/h/yX9uRklV1scHQ5oIiDDGsV93FRRytsdc05xa7jTs=@lists.linux.dev
X-Gm-Message-State: AFuF++l+Lc7o1yiN/7O25LBFf5ED21a6xx/cODa5cFEtANSNcM5BEUbg
	1YPV71BpHomzlDi5QQ35k9pgRAh23RHgk+h/rxnIadgZEIcQIm26ziP5Dau9B39aPrQ=
X-Gm-Gg: AYBFou3p8imzoALE3HAWJbOVibv9t7zSgi6UWXWKwLU6Gve8Uj4eMjrHGYrIPTtsuMB
	A5zoXblIpA/w/ErU37v22h2+yRsYRx8/kBWl5DrM/mXn8ftabklEa5JGmPV5jL7dYOXrzRKxlT0
	OmNvs+JGb2xZDQg27qwdI35RFE/dc4eeg1k4tNCLBw49lZQxmh3C+Shjxwa8sunFcX/iWQ+ecZK
	6KglQBc103BjnRo+/QCwlSTthXyPDZIEwUPbSOa6BQYOXIWUqaFPvp3Akt5xJbAr6fTM4dgwrsr
	h0EBjp37kJasQpSYxSZE2G8a2r4M5v5T8OaOzc6iwwDsPUcT/ZDgH9DA7578yF+uMYsKmgnTYMm
	xYcIaC4ZenoDTQgPf0VKy7mrTSzFUq2qt1Xxu+E/7PSrmTcSTcfH7Jih0858h0ncH9kCRWZpPi/
	SCjr//AOxlWHwZJRZb1K/7huI57AChE0u+s1VdwsWjBOXmQ4GkRBsEL3lzVtdMLD7OsmYPggBIv
	CKf17YVFc1aDvVVzPy80r1EfnXaGd/jrZA=
X-Received: by 2002:a05:6000:29cb:b0:485:8df2:6460 with SMTP id ffacd0b85a97d-486e0f776c3mr3738554f8f.20.1789043406106;
        Thu, 10 Sep 2026 05:30:06 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm55987457f8f.25.2026.09.10.05.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 05:30:05 -0700 (PDT)
Message-ID: <65b2a754-c180-42a3-b6fd-f8714804c043@suse.com>
Date: Thu, 10 Sep 2026 14:30:04 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: reject out-of-range relocation target indices
To: Helge Deller <deller@gmx.de>, Karl Mehltretter <kmehltretter@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Ard Biesheuvel <ardb@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-modules@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260908230815.78409-1-kmehltretter@gmail.com>
 <a8f29668-be71-4679-a95d-55dfbd9b5c61@gmx.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <a8f29668-be71-4679-a95d-55dfbd9b5c61@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 12:59 PM, Helge Deller wrote:
> On 9/9/26 01:08, Karl Mehltretter wrote:
>> apply_relocations() skips relocation sections whose sh_info target index
>> is outside the section table. ARM, ARM64, LoongArch, PA-RISC and RISC-V
>> use sh_info earlier in module_frob_arch_sections(), before this check.
>>
>> ARM, ARM64, LoongArch and RISC-V use the unchecked index to read
>> sh_flags outside the section header table. PA-RISC uses it to index an
>> e_shnum-sized heap array for a read and an update. QEMU reproduced
>> page-fault Oopses on ARM, ARM64, LoongArch and RISC-V, and a Data TLB
>> miss on the PA-RISC array read.
>>
>> Validate sh_info for SHT_REL and SHT_RELA sections in
>> elf_validity_cache_sechdrs(). Reject the module with ENOEXEC before
>> architecture code can use the index.
>>
>> Fixes: c298be74492b ("parisc: fix module loading failure of large kernel modules")
>> Fixes: 7d485f647c1f ("ARM: 8220/1: allow modules outside of bl range")
>> Fixes: fd045f6cd98e ("arm64: add support for module PLTs")
>> Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
>> Fixes: fcdfe9d22bed ("LoongArch: Add ELF and module support")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>> ---
>>
>> A custom harness for upstream Frama-C 33.0 (Arsenic) Eva found the
>> ARM32 instance in a source-identical ARM module_frob_arch_sections()
>> slice. Eva reported the out-of-range section-table pointer and sh_flags
>> access.
>>
>> The analysis and ARM32 A/B test ran at Linux b9b3e33b70b7 ("Merge tag
>> 'trace-v7.2-rc6' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"). The
>> PA-RISC, ARM64, RISC-V, LoongArch and x86_64 A/B tests ran at the
>> declared base commit, 28924df2a08f. arch/arm/kernel/module-plts.c and
>> the touched loop in kernel/module/main.c are identical between the two
>> commits.
>>
>> Each A/B test changed only a relocation section's sh_info to
>> 0x10000000. The same configurations and modules were used before and
>> after the change. All controls loaded before and after the change. The
>> fixed kernels rejected the malformed modules with ENOEXEC.
>>
>> Original-kernel results with QEMU 10.2.1 TCG:
>>
>> - ARM32, virt/Cortex-A15, GCC 15.2.0, multi_v7_defconfig plus
>>    VMSPLIT_2G: page fault at module_frob_arch_sections()+0x160.
>> - ARM64, virt/Cortex-A57, GCC 15.2.0, defconfig: page fault at
>>    module_frob_arch_sections()+0x110.
>> - PA-RISC, B160L, hppa-linux-gcc 8.1.0, binutils 2.30,
>>    generic-32bit_defconfig: Data TLB miss at
>>    module_frob_arch_sections()+0x11c on the stub_entries read for a
>>    counted R_PARISC_PCREL17F relocation.
>> - RISC-V, virt, GCC 15.2.0, defconfig plus RELOCATABLE with
>>    MODULE_SECTIONS enabled: page fault at
>>    module_frob_arch_sections()+0xe4.
>> - LoongArch, virt/LA464, LLVM 21.1.8, loongson64_defconfig: page fault
>>    at module_frob_arch_sections()+0x1b8.
>>
>> On x86_64, which has no vulnerable early sh_info access, the original
>> kernel loaded both modules. The fixed kernel loaded the control and
>> rejected the malformed module with ENOEXEC. The test used pc/qemu64,
>> x86_64_defconfig and GCC 15.2.0.
> 
> Interesting.
> So, this patch helps to prevent loading modules with buggy entries,
> even if the module was e.g. loaded on x86-64 before.
> 
> For me the patch is OK, but it only adds one random sanitizing check,
> and where would we stop to check?

Loading a module should normally at least get through the signature and
blacklist checks without crashing due to a corrupted module ELF file.
After that point, I believe the ELF data should be trusted, similar to
how the actual module code is expected to be correct.

module_frob_arch_sections() is called later in the module-loading
process, after the signature and blacklist checks, so I think this patch
is not strictly necessary.

-- 
Thanks,
Petr
