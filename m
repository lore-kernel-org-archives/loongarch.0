Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E64368D62;
	Wed,  2 Sep 2026 05:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327297; cv=none; b=hDA6wpUatpAXIQO27aIKyyD3FbwGA/QwLXYK4xGO6cYYk8Qa0qOi3tmRQ9wS8msU1vyxPRPLIT61/dnGxCQP089Ycmgn3f10zviBSci+plhxDQP2yDnqFG4TZwLGkktasIQyfq4W6RMovG13vBkqouyvryxEljk3JSb3uPJh0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327297; c=relaxed/simple;
	bh=Omnbex0Tjgduu+oar2rNHU+lHUhTBsAOILG8aWQOw+w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iweGNKF/OeMj/Eol+YunhNlVCJnRTFh91W3Z/oJRBXM7qSLterbvGnOsUTxx/yzaO46ffkrFUxxBf6T8Bb44oc4YyMljoyc7uSqbh7dg4qcz7CPnDajw18ODr8fbD828+1cvDU+/1JUK2Niext49PVODIk5FcIPZ3rWdAIH4o0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnEiX6ZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnEiX6ZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983851F000E9;
	Wed,  2 Sep 2026 05:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788327295;
	bh=4+J2Jj2HRrACqcAaQEKzV2dhwA6iYSIh+wTxScdcYp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SnEiX6ZVRKNTlEzYhdNfLWvZ2V6gv7CAk4V6VlJVOjWftIIfZI4jZjIgP6Ekow5aH
	 Dea+Vm53VDAB4oQGDi8tH78zhPRXDwvL02py7j6g3xDm2VOCAAViiylf+CiqP0SgJf
	 fg/62uxQZenLhBbzQzQLNpYwzO+DW1dkgB1b9YH7qgSXa1VHHFfDtvzEZ2mdgJAZIg
	 A7yaG0RTzthG0310R1CH4miU2uAMobA4Gbzu1/HdGgcYQ3bOdF6FRG2nWtYRqZ9kOt
	 2o+4nKyq2up6v5DA1Ry9IbGDHHLpb5cYrXahXYlF34RaRqxIx8HPlN6k7BXBpDUBzS
	 AhrKMXU+6FOog==
From: Mike Rapoport <rppt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>, Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Bradley Morgan <include@grrlz.net>
In-Reply-To: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
Subject: Re: [PATCH v3 0/2] kexec: fix probe error codes and error
 propagation
Message-Id: <178832723438.3691424.5459141264864633147.b4-ty@b4>
Date: Wed, 02 Sep 2026 08:33:54 +0300
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Fri, 21 Aug 2026 19:19:56 +0530, Mukesh Pilaniya wrote:
> kexec: fix probe error codes and error propagation
> 
> While debugging a misleading error on s390x where kexec -s reported
> "syscall kexec_file_load not available" instead of the actual EINVAL
> from a kernel command line that exceeded the architecture limit, we
> found that some kexec image probe functions return -EINVAL instead of
> -ENOEXEC for format mismatches, and kexec_image_probe_default() has a
> bug where it returns whatever the last loader returned rather than
> always returning -ENOEXEC when no loader matches.
> 
> [...]

Applied to kexec-fixes branch of liveupdate/linux.git tree, thanks!

[1/2] kexec: return -ENOEXEC from image probe functions on mismatch
      commit: 2792b4b15f148b142a4302706410e520c8049c00
[2/2] kexec: fix error propagation in kexec_image_probe_default()
      commit: b7c94f4d0961e3ea8ce0463b6eda1bb2cf9f2694

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: kexec-fixes

--
Sincerely yours,
Mike.


