Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7E2D97BA;
	Thu, 20 Aug 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249328; cv=none; b=tdoh1TCs9pDmGs0NCPLKmcIABfBhAn1cPaXkkrjrQhJ3Z4CJwaAJcG5ULKmMVYB9g/jPCrV9O2vO5ZYuxYEDS81QfOa57HC4qxDtLaRo6RZzbqWZHu5epAkVFUUy/j7t2dXXfvT6V6TVX376Stlq3HkUtROgpbCu7IxHRyzZhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249328; c=relaxed/simple;
	bh=1vWyLQsnaSLaPrO8QI7xFJuN8G/Ye25GIr5V1GYkjPM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zo4sol0Sj8R2A4Y8Tdh3Z1gWYn6sJuAGfOlO2X042keaEhVMF/OmCnjRrlmVlvYWqfkRLxYMKOUqxEseGfXJoEJ0vELlZMw7viKNQb/dIMlGwUt8ZF6n73OG+6ZPGwRNzbfaG1VR5mC8k2YUJ0PEr/iyuk744TjQqKnRnwiUPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpeQzaY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpeQzaY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BD01F000E9;
	Thu, 20 Aug 2026 18:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249327;
	bh=Q1ljl4cz56ii5aPmEh0p+/B4T88PoXWLCILEreXEYY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DpeQzaY1MvfM6dZTH/+yddWLJh5BvqpeaOdNnVIoPbjkcLgbNv4xUX5XKLpwz198R
	 Mpkaq94EpVdGZ9ebfp6nIELSeGFnkvGMKsCbVb872lHcJSOHsfYPc9fW/xC9ie0tm0
	 lGo8oVkNkeONksK79F2+xNkEhlwqF9xrfKRpDlIM47S5YbOECIuTbvucsW/Uwengxm
	 pmnKRVjNpMxjhNkh2mJS16ZEYtMTXVV3dAV/H6Qe8D7WhK9thXOYqUTGk/bVS5AbkR
	 lCGbe6ESXOR423vvLyFXRQ8QU/JS4WymEY2f4DpLIl3nSBX0Es+D/jyyzBU6pPNMOh
	 ces9hPevHWuUg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  Huacai Chen
 <chenhuacai@kernel.org>,  WANG Xuerui <kernel@xen0n.name>,  Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baoquan He <baoquan.he@linux.dev>,  Mike
 Rapoport <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,
  Pratyush Yadav <pratyush@kernel.org>,  Tao Liu <ltao@redhat.com>,
  Philipp Rudo <prudo@redhat.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  loongarch@lists.linux.dev,
  linux-riscv@lists.infradead.org,  kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
In-Reply-To: <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com> (Mukesh
	Pilaniya's message of "Wed, 19 Aug 2026 23:17:23 +0530")
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
	<20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
Date: Thu, 20 Aug 2026 20:08:42 +0200
Message-ID: <2vxzmrugzmtx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 19 2026, Mukesh Pilaniya wrote:

> kexec_image_probe_default() overwrites ret with each loader's probe
> return value and returns whatever the last loader returned when no
> probe matches.  The error code reaching userspace depends on whichever
> loader happens to be last in kexec_file_loaders[].
>
> Only continue to the next loader when a probe returns -ENOEXEC.
> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
> only when all loaders have been tried and none matched.
>
> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
