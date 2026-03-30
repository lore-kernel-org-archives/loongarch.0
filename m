Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC713815C0;
	Mon, 30 Mar 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862152; cv=none; b=PLTk+PFgh2ybrS9A3jIttQmNewOOqxxKDZflY2R8zjUuYn41iZxZghv7492poZT7of7SjlaRPLgDxHU6H743wp2NLL0//kg8WIUg3IgoHXvjRVlULyPG3xRNmUBZAxzaQ7kMdUnTPOn2YUqFCMFUu9aWjuCPROd3/5Bq4OIli0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862152; c=relaxed/simple;
	bh=nSAMhAy2NHmQUPSXPLIcBAWN1McDpN+/e2HfgQZTDIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDsyslaMDVAkgZhZMCA/zgu/F/nXgiNLh/6SrqYxAvkPjXfL1rKVdqEvQRbvHcEI4zTSyAJHx9UqHewG1HjANEDNNJu1dA9cITtofRWcY9wO0TNMUmmlS6l1Bp7Iwc6ze+ObGYSQguVd7d/oEVw+gjjUNcQMcRO45yzsvU+Zips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IjoUdYg7; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IjoUdYg7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=WO1vn6Tln5KFquM2TJaKxzbEqp7cPSRmlLOOnQm4DBk=; b=IjoUdYg7H5HjzhmD9Ya8KzCZED
	MOdt/f/iybG0j7ZLGmiC7aJOgf9EGEZ5AT6v30A7lr8C+eX+qUGhl5lLwhUy7Ag2vW87+rI4cKgR0
	IreKmv/ogatlCLSyoDgJQL/Bm0oZPTC3Ph6N6bEB8K2FbqIE9a2RJzwF5rC3QyiVtqaFsRExlbFnq
	w6kBr9fPUeAdfZ2RsOnmOj6jLS7FgdEY+TwNyaPu3c4DAiLI7ICVb5EP/dox4qH2GHtCEzV9jz6MU
	LmEcDrV31BMlEKYMm8KfrbhCwKfgUBdd6N399NiMCtz+aDHCvorriy5EW4hCaA9xT6qUKgk0TT0qt
	Qm7u5jxA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w78hH-001L8R-10;
	Mon, 30 Mar 2026 09:14:10 +0000
Date: Mon, 30 Mar 2026 02:13:57 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	rppt@kernel.org, ardb@kernel.org, cfsworks@gmail.com, osandov@fb.com, 
	jbohac@suse.cz, tangyouling@kylinos.cn, sourabhjain@linux.ibm.com, 
	ritesh.list@gmail.com, eajames@linux.ibm.com, songshuaishuai@tinylab.org, 
	kevin.brodsky@arm.com, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
	coxu@redhat.com, fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com, 
	guoren@kernel.org, chenjiahao16@huawei.com, hbathini@linux.ibm.com, 
	takahiro.akashi@linaro.org, james.morse@arm.com, lizhengyu3@huawei.com, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v11 10/11] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <aco-v4BuRSiZx7yy@gmail.com>
References: <20260328074013.3589544-1-ruanjinjie@huawei.com>
 <20260328074013.3589544-11-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328074013.3589544-11-ruanjinjie@huawei.com>
X-Debian-User: leitao

On Sat, Mar 28, 2026 at 03:40:12PM +0800, Jinjie Ruan wrote:
> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
> 
> Crash kernel memory reservation wastes production resources if too
> large, risks kdump failure if too small, and faces allocation difficulties
> on fragmented systems due to contiguous block constraints. The new
> CMA-based crashkernel reservation scheme splits the "large fixed
> reservation" into a "small fixed region + large CMA dynamic region": the
> CMA memory is available to userspace during normal operation to avoid
> waste, and is reclaimed for kdump upon crash—saving memory while
> improving reliability.
> 
> So extend crashkernel CMA reservation support to arm64. The following
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
> arm64 architecture.
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Baoquan He <bhe@redhat.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Tested-by: Breno Leitao <leitao@debian.org>
