Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6546AF12;
	Tue, 30 Jun 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834623; cv=none; b=tt43vawGwdxekQMmbDhVgpljv7rFND0WbEv9T2gR0AqYu6+cWlr34a+J2Hsth3mJjXy3f3UkPjiS4Sp7Djb/76Ph2OC1Ue7YOeSJCK1LHZMcdWz9pQZYmTMlSQC/pwcgTJwusMo+Aj9xAjYxAmJxiiil6VvFcfaVipburUn9utY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834623; c=relaxed/simple;
	bh=wJVOvcEEpbA1CW16gcTsNnjYtnN5mAQFWxq+X6OZbkg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BEm8+WtTBi+2+DDzz4P6JnpUppnDXg/VZbTwe3r1IN5paHrhf9eYjHO7lwI832Cs17lDcGC6kYhlEs3LYlFC+4WJ9ivV73rveBcRcwY50TArUmtffNyMi31GGS48lN8Fj+nVS+O2/G9Zdxt/iyRet1bdMJU+tsViap2U8Hxl8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYaFsO0F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYaFsO0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272C01F00A3A;
	Tue, 30 Jun 2026 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834617;
	bh=orBYolOiVh8P+Gs6dp8/inZibU5jKERhYsBdgyU7ewg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=hYaFsO0FH9QTvOvjL+VAVldlJ2YPFGk7Uv9Z6QoYCVHtTYFvz5GLpT1JPoGmvuzja
	 MTy6IgtdK2zMOgBks1ci94yQnYzuxOJiLmpU/slEb508GaEKc1CAdIz3+/Zq6Bt0w9
	 2FVSSC8lyJ1ZeKB8y1XDpUIRQvZEcPOZths6ZliY3SggfKoZOFKnqpC88EFu33XLTW
	 sn6AnFxz4EW0LATrsCAmY8ssBo7Q13rik2AkR7zp8ALgguCfUFUhwRyu2d3NhQu+/K
	 Y2AM6LawUcaWvPp3WCkTdmmqcN+TndJjAv7WwB1TzTqCVHBCGCID2JuhETb5Xb/WQQ
	 rTUnWQuYsWNdQ==
From: Mike Rapoport <rppt@kernel.org>
To: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
 chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, 
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
 saravanak@kernel.org, akpm@linux-foundation.org, baoquan.he@linux.dev, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
 rdunlap@infradead.org, peterz@infradead.org, feng.tang@linux.alibaba.com, 
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com, 
 kuba@kernel.org, ebiggers@kernel.org, lirongqing@baidu.com, 
 leitao@debian.org, kees@kernel.org, coxu@redhat.com, cfsworks@gmail.com, 
 jbohac@suse.cz, osandov@fb.com, ryan.roberts@arm.com, 
 tangyouling@kylinos.cn, sourabhjain@linux.ibm.com, ritesh.list@gmail.com, 
 gaohan@iscas.ac.cn, david@kernel.org, wangruikang@iscas.ac.cn, 
 muchun.song@linux.dev, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
 guoren@kernel.org, namcao@linutronix.de, rick.p.edgecombe@intel.com, 
 djbw@kernel.org, liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, 
 vishal.l.verma@intel.com, chenjiahao16@huawei.com, x86@kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, kexec@lists.infradead.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260629094746.191843-1-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH v17 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-Id: <178283459765.548295.14688999641870037803.b4-ty@b4>
Date: Tue, 30 Jun 2026 18:49:57 +0300
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 29 Jun 2026 17:47:36 +0800, Jinjie Ruan wrote:
> arm64/riscv: Add support for crashkernel CMA reservation
> 
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> [...]

Applied to crashkernel-cma branch of liveupdate/linux.git tree, thanks!

[01/10] riscv: kexec_file: Fix crashk_low_res not exclude bug
        commit: 5fc6e7d45373571d03cd04fd4c6069c0a97fa75a
[02/10] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
        commit: 202b5de3ec34317d6a8944239fe227ef8f6853ec
[03/10] crash: Add crash_prepare_headers() to exclude crash kernel memory
        commit: 5beabef0cffaa1ea6e27e85dbd526b7a28e0e7c7
[04/10] arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
        commit: 201b561cbc6c594aa1ef718a1204dd45720d96dd
[05/10] x86/crash: Use crash_prepare_headers() helper to simplify code
        commit: a8f09f2a7485956c3653696f6cb94faadd243645
[06/10] riscv: kexec_file: Use crash_prepare_headers() helper to simplify code
        commit: 7b078a0aa2753dcf5cae88e5349a25ac39998a9b
[07/10] LoongArch: kexec_file: Use crash_prepare_headers() helper to simplify code
        commit: 51ed0950adf05c99e393818887a2616dd4ab3e34
[08/10] powerpc/kexec_file: Use crash_exclude_core_ranges() helper
        commit: b0e06c5a30742bc6bc8523fe9c71c1a043a7661d
[09/10] arm64: kexec_file: Add support for crashkernel CMA reservation
        commit: c12c63d05dfe7088aa8b1b872fe261e25537c823
[10/10] riscv: kexec_file: Add support for crashkernel CMA reservation
        commit: a037fe3c58ed489ca8ad8531bd7e16b90a84badc

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: crashkernel-cma

--
Sincerely yours,
Mike.


