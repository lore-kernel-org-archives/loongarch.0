Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54822FF22;
	Fri, 13 Feb 2026 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770952221; cv=none; b=rKmR7Jp47UQBt17aPIyyrQ1qyGSIqvq+0I+80bS6ignBvGO4m0nvqgRkIl8GhnPxwdCXAulE0eil8XKpMrokQRaHs6k3mAETiyDquUI5TGTKIhuxmTdJKRXuHEi7D+z8uqt56ThaVH2FeapIJtft6n8DpxTUPCBRBJ069QKdcHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770952221; c=relaxed/simple;
	bh=DlVfwlabE/UrECF6UV6WXsGt9/oBuJ/GsD7QC77Cks8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ywl2ALH3UboyB0eUnoLlj2u2HJuvn7uEisH708hqNbP+02T86VovgHe3FCDm353GBmnOueoEddeTYssOutl1oQf+H4PbstyEVjZUJC7YiHuQk59JWiixYIxY20/q2VaKWJjPkykYle2zyDqeMJjB3FYNtWZr6LHzQ3uMDPMi3y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqncZvbj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqncZvbj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C7CC2BC87;
	Fri, 13 Feb 2026 03:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770952221;
	bh=DlVfwlabE/UrECF6UV6WXsGt9/oBuJ/GsD7QC77Cks8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UqncZvbj0SmNgh6HQ/8D5uoY1GFs2E42UQc+n7sxEIeVzpQSz2IMx9zVWyz7j4P7+
	 tfOiJuyBxCrBsc2bAheTKpm+HdgmlfqnLuZA8ABBgI8BB4Lb7+u/ibAQCcDmZLMtyq
	 Dq96qaThsOFsKMLtIO2NcWVBj+w9FzkKz/VUtZt1faNqiV0NkWWQW2B8WwY9y04Gcd
	 aYQgjkp6ysc/U+JYrKXXYSXRfOItiv0ulvtW6qVQy79wnnzFOinDd0RjM46o52YLFs
	 e8YKvqJaZE43RDWwzJya1N+H3cjiEt8a6WCf6LJlnzNFusrJSTRdUBupc/JwHn7iy/
	 2DRGVckeUTNTA==
Date: Thu, 12 Feb 2026 20:10:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
    will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
    maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
    chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, 
    bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
    akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com, 
    dyoung@redhat.com, rdunlap@infradead.org, kees@kernel.org, 
    elver@google.com, paulmck@kernel.org, arnd@arndb.de, fvdl@google.com, 
    thuth@redhat.com, ardb@kernel.org, leitao@debian.org, rppt@kernel.org, 
    osandov@fb.com, cfsworks@gmail.com, sourabhjain@linux.ibm.com, 
    ryan.roberts@arm.com, tangyouling@kylinos.cn, eajames@linux.ibm.com, 
    hbathini@linux.ibm.com, ritesh.list@gmail.com, songshuaishuai@tinylab.org, 
    bjorn@rivosinc.com, samuel.holland@sifive.com, kevin.brodsky@arm.com, 
    junhui.liu@pigmoral.tech, vishal.moola@gmail.com, dwmw@amazon.co.uk, 
    pbonzini@redhat.com, kai.huang@intel.com, ubizjak@gmail.com, 
    coxu@redhat.com, fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com, 
    brgerst@gmail.com, jbohac@suse.cz, x86@kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    kexec@lists.infradead.org
Subject: Re: [PATCH v5 4/4] riscv: kexec: Add support for crashkernel CMA
 reservation
In-Reply-To: <20260212101001.343158-5-ruanjinjie@huawei.com>
Message-ID: <97c57b38-2970-bdd7-2303-6de9a5c14d14@kernel.org>
References: <20260212101001.343158-1-ruanjinjie@huawei.com> <20260212101001.343158-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Feb 2026, Jinjie Ruan wrote:

> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation. This allows the kernel to dynamically allocate
> contiguous memory for crash dumping when needed, rather than permanently
> reserving a fixed region at boot time.
> 
> So extend crashkernel CMA reservation support to riscv. The following
> changes are made to enable CMA reservation:
> 
> - Parse and obtain the CMA reservation size along with other crashkernel
>   parameters.
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> - Include the CMA-reserved ranges for kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore, which is already
>   done in the crash core.
> 
> Update kernel-parameters.txt to document CMA support for crashkernel on
> riscv architecture.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Looks reasonable.  If the plan is to have the kdump maintainers merge 
this, then:

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul
