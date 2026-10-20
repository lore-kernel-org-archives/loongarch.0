Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483797;
	b=bhiw/KCs+tFKVj/n8SkZglhHpiF8ZluX3hb8b1XPzV2e4dToS+KGLFzPIYFdUOPTRvUy
	 C9ibcTcu2NGH3XimxJ81dMuavCwcgdDVh98st5jkRBo/IDd3Hu3YDENUTnrdQphqvvwIp
	 yg/k6Y9oPs7cfxV4cBjCUl/nbDf7q1FpgGoJ6fITXKOxfeEUmDL8Bl89a8WpQGZDbhbNb
	 mEySqZadLvm2Ezlya3PiSWrzNu06Msj1rwxz99ZEH48lh4YrOEQ0Yse+C8VNP7yOfEq6W
	 4jxWRVz/B4wgoMkZjMxOO/KuWAJHEe/vJJmZf33eLqei/rbyHR3vk8zUTABQrWo5g+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483797;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=XSsZkzzBNNe/aTV43Z32nPhmjz0NciIMlK5b8uQ8eSs=;
	b=rCOxB0on43J3GMqCUf6Qao/psTIpNZHvUTdWuzeyyyAT+iL7wwaYXE7FYVXoNVMxfnWY
	 FwP/8ZZtzyf4uB7h+MY1zh/zfnqnrc4RNsgcpwcGRrzyAFFxOBwZcMea/5HchzIldfHqd
	 BUV0ddOBzBwSNBDP9uR0CXMmVypusxJTU9Oy+wg8Vhvks3OtYWhbkiQLa7irw6WwyjlwM
	 6kSBWXEju0YAZo83pUmXToHlnsLavb4rEDZcN0vQtgJoVmPz03X1shWhvHnvdkNjxTEog
	 30+gzKqk7fzDK/EJT2hE4XEIXIuDVSH6bMbJr28yiRwSuE2akJ2oeh/i0aEo+GAHvEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bz1GiMUt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D7606A319;
	Tue, 20 Oct 2026 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bz1GiMUt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361FF1F000C4;
	Tue, 20 Oct 2026 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483797;
	bh=XSsZkzzBNNe/aTV43Z32nPhmjz0NciIMlK5b8uQ8eSs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bz1GiMUtVdCxcnrgWdw0nUgk3XjmNZkUSWIAKL6542R8NsGR9CCPthO/llpAKQpVs
	 BMrYgVtgXR+WBclpzdm2maK+uihORxVis9YyGSohSAC9tcKWg3sWc7sNaMbPLcTF/m
	 jLqY2p8/fix+MJqukHD6KLRg0t8y8yRkCW7UOIfmhWudURS2yJ4OsYMY6iwbUTnxKx
	 OViCdgx01YkG1X8f7F8+iPsg5qvr+T4GyTzQ7EfBugtX5bw7V3bfLGdboJIhMaLgfd
	 qO1VcSV6mjmsF7exhP7uFHh7iJLKUjxZSpuOx1L0fzwUoXjoX5ANMdrJnQGjqVob3+
	 MfrluQfgmtYOQ==
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
Subject: Re: [PATCH v6 00/14] crash: Fix several bugs
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
 chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
 ritesh.list@gmail.com, sshegde@linux.ibm.com, tglx@kernel.org, 
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
 leitao@debian.org, yeoreum.yun@arm.com, sourabhjain@linux.ibm.com, 
 robh@kernel.org, coxu@redhat.com, kees@kernel.org, tangyouling@kylinos.cn, 
 liukexin@kylinos.cn, zhangtianyang@loongson.cn, guodongtai@kylinos.cn, 
 maqianga@uniontech.com, chao.gao@intel.com, kai.huang@intel.com, 
 vishal.l.verma@intel.com, seanjc@google.com, piliu@redhat.com, 
 thuth@redhat.com, jbouron@amazon.com, me@linux.beauty, 
 mclapinski@google.com, graf@amazon.com, bgwin@google.com, 
 hbathini@linux.ibm.com, eric.devolder@oracle.com, 
 takahiro.akashi@linaro.org, james.morse@arm.com, palmer@rivosinc.com, 
 x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 kexec@lists.infradead.org
In-Reply-To: <20260921090450.807575-1-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
Date: Tue, 20 Oct 2026 11:09:39 +0300
Message-Id: <179248377975.302547.11812783408034710690.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi Jinjie,

Sorry for the delay, it's been really busy time for me.

> As Baoquan and Catalin suggested, this patch set fixes
> several pre-existing code issues found by Sashiko AI [1][2][3].
> 
> The major improvements and fixes included in this series are:
> - Fix several memory leaks for arm64, and similar issues on LoongArch
> - Fix out-of-bounds write on 32-bit Highmem for x86.
> - Fix TOCTOU race in crash memory range collection.

It feels like these are three independent series, maybe with slight
dependencies because they touch related code, but it's not really a
single series:

> Jinjie Ruan (14):
>   kexec: Fix CMA segment address translation with non-zero text_offset
>   kexec: Record allocated CMA pages to fix release size mismatch
>   kexec: Extract kexec_free_segment_cma() from kimage_free_cma()
>   arm64: kexec_file: Fix CMA page leaks in segment placement retry loops
>   arm64: kexec_file: Fix elf_headers memory leak in retry loop
>   LoongArch: kexec_file: Fix CMA page leaks in segment placement retry
>     loops
>   LoongArch: kexec_file: Fix elf_headers memory leak in retry loop

The very similar commits for arm64 and LoongArch imply that that we have
some code duplication that should be addressed regardless of these
fixes.

-- 
Sincerely yours,
Mike.

