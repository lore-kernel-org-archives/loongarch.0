Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1A48822C;
	Tue, 25 Aug 2026 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670908; cv=none; b=V7SkDgjO3OecTiTYqkhw5+vkq3l1+w+KftgFYVSCVPgndIrv3p9BB/EpK41iWXe2A+LMQLZPFkMF8wbhIK0vWYbo8dU4910qJAD4o1nRjkesc2N6PK/VbkQ0kCsEx7j2zDioKa0sG5w9GFmVbZYvKtNXGCdWpALOczb+nkskW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670908; c=relaxed/simple;
	bh=Fv8ErCRrZkPu8Ql6LuXEKfa+hj0OjuxtPQOTO3+nlW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeMKxyamCSCPKTMqQT0V5fMOG9L5BQFColbow3w1oqgq+MwrqQtApkJGDpXY4rckZnwR+3C7iCCbSP2c8x1yWzWdGXn9YZZQqTOa2RpNcbnZzq6rzwwmfhK7edQWuJfZuoVJ4I3SK7lGgkxoPLI8JlWAAqXbqNImZMj7TzzRd6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKt9XnhQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKt9XnhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DED1F000E9;
	Tue, 25 Aug 2026 15:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787670907;
	bh=rLscfcmLNRd3f1PhGpx41k5USRhZyaKtVT+AsVQwKXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKt9XnhQJ0Jv+LiWz7EZIWcKUj5pr1jQioPbRmKBddxcRnglcwR5/jrHA5iIVfgMI
	 HzjOfACz98g59qd/tOWKog6WxXKhD/KXaPFhYLMhIv+XPz2PXkzM++hVZ+X7BI4EKZ
	 aNUY9GhhNCFYR0CsWpf3YU61x+NPvUH26AY/MR4ivFRWyMqmS8iskw33wGv8pU2sUD
	 KIcUtDB0UOjyqz8AR6cGUd8saiE6nhOt7YvUnUmcmwS5q4dUqZM8zRo0VF5J2ETElL
	 aIqyGX/67NJ2/2baRrQhN5xL4WqYIhVN+uYx9vefhAK4e7Uw1k3Eb/yWzfAlOx86Z3
	 8vHf8+1Nvz11A==
Date: Tue, 25 Aug 2026 16:14:59 +0100
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
Message-ID: <ao2xc027TNYTwBA1@willie-the-truck>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
 <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
 <aoxQFxuzZ1AHmM8d@willie-the-truck>
 <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>

On Tue, Aug 25, 2026 at 10:43:48AM +0530, Mukesh Pilaniya wrote:
> On 24/08/26 7:37 pm, Will Deacon wrote:
> > On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
> >> Several kexec_file_load() image probe functions return -EINVAL when
> >> they do not recognize the image format.  A probe function that rejects
> >> an image should return -ENOEXEC to indicate that the image is not a
> >> recognized executable format.  -EINVAL implies a problem with the
> >> syscall parameters, not with image recognition.
> >>
> >> kexec_image_probe_default() iterates through registered loaders and
> >> returns the last probe's error code to the caller.  That error
> >> propagates as the kexec_file_load() return value to userspace.
> >> Returning -EINVAL from a probe when no loader matches is semantically
> >> incorrect and misleads userspace about the nature of the failure.
> >>
> >> Return -ENOEXEC from all probe functions and their helpers when the
> >> image format is not recognized.
> >>
> >> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> >> Reviewed-by: Philipp Rudo <prudo@redhat.com>
> >> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> >> Reviewed-by: Bradley Morgan <include@grrlz.net>
> >> ---
> >>  arch/arm64/kernel/kexec_image.c   | 4 ++--
> >>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
> >>  arch/riscv/kernel/kexec_image.c   | 4 ++--
> >>  kernel/kexec_elf.c                | 4 ++--
> >>  4 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > Hmm, so after this patch, are there actually any implementations of .probe()
> > that return anything other than 0 or -ENOEXEC? I couldn't spot any after
> > a quick look.
> > 
> > Willkexec_elf_probe() can return -ENOMEM if memory allocation (kzalloc())
> fails inside elf_read_phdrs(). This behavior was previously discussed in
> the first patch of this series [1].

Fair enough, but I'd have thought it would be easier to special-case the
one -ENOMEM path instead of changing all the backends to return
-ENOEXEC all over the place (and hoping people don't start returning
-EINVAL again in future).

Will
