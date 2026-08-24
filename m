Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008FC34B19F;
	Mon, 24 Aug 2026 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580448; cv=none; b=QbH1WHR/Vp9MH31xxnpYjWVt8pNK53K3P6MeD0XQ9Eb84tVV8lAlMF1T85WseIEzDr3w1D3BhC5W0kjNtJXhcrSAlhuIG8nzjFu7BM2vTEKvb4Jg6X87Pfa9VKsmYt5aLnuvPhhjXvEDZKR/mMgNAoopRhxJKgO5WORA5Skp8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580448; c=relaxed/simple;
	bh=tQbR+bEVCH1buLfGVABqjtYh181VbY5gEjSmEhFKiUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBQN0WwEF/bxRFJMr1HFzXsYDTagpxqyfwGGLQj75obrTEyuoM9bzmKLro/VemlIlkC77kxh42nyEGUguL54whptIfyJcFe9yoTOd89qX87dCF1FDEefHD2rh8BNfyi6nZVrbUWREqMGjysJ1jUfEl/FmvBYxh1orXHxENNvaww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOv+PwCG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOv+PwCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EE71F000E9;
	Mon, 24 Aug 2026 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787580446;
	bh=my9GYhoB5pagzF6M6ZagB0B0WZqIwM9tl/SdPaf+pZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TOv+PwCGfXFC332KGFB9T7dQXJCrhXdMJFRpEQ9/TE3Vx6NIAY2MKQP0Iznx7qRcz
	 L2MrLS5j4meQvz+/oOSbDMYImL0w/a+KlTtqGfu3JwN/vioyhG8u2vZ1p45PJIb/Ga
	 2njsOlOPXwa4SCTgrRl3GWIu3eDt+mXQ/BLl+ocbChhTFt363vDUHPRQpA9rHDkdG/
	 8j3imGMbxGZ2S/VjpPB98mGjco2CXiZHRzysGH5l3+mQoZqDUN5dAfXyj51k8QHx8J
	 IqGM0pZEDWjWBuH2ICNqxRnUPl1xf8qU0LuX04/D7Zj0qES6hFUgP2PlHWXXY84ZeU
	 o+MyUMGi/9STA==
Date: Mon, 24 Aug 2026 15:07:19 +0100
From: Will Deacon <will@kernel.org>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
	Philipp Rudo <prudo@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, Bradley Morgan <include@grrlz.net>
Subject: Re: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
Message-ID: <aoxQFxuzZ1AHmM8d@willie-the-truck>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
 <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>

On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
> Several kexec_file_load() image probe functions return -EINVAL when
> they do not recognize the image format.  A probe function that rejects
> an image should return -ENOEXEC to indicate that the image is not a
> recognized executable format.  -EINVAL implies a problem with the
> syscall parameters, not with image recognition.
> 
> kexec_image_probe_default() iterates through registered loaders and
> returns the last probe's error code to the caller.  That error
> propagates as the kexec_file_load() return value to userspace.
> Returning -EINVAL from a probe when no loader matches is semantically
> incorrect and misleads userspace about the nature of the failure.
> 
> Return -ENOEXEC from all probe functions and their helpers when the
> image format is not recognized.
> 
> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> Reviewed-by: Philipp Rudo <prudo@redhat.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Reviewed-by: Bradley Morgan <include@grrlz.net>
> ---
>  arch/arm64/kernel/kexec_image.c   | 4 ++--
>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
>  arch/riscv/kernel/kexec_image.c   | 4 ++--
>  kernel/kexec_elf.c                | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)

Hmm, so after this patch, are there actually any implementations of .probe()
that return anything other than 0 or -ENOEXEC? I couldn't spot any after
a quick look.

Will
