Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573323BCD3C;
	Fri, 14 Aug 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716850; cv=none; b=oPRDGl1gXmmsUSe4oG3l38R8jHu88wP0rhSzRWgNdAcoMNwbqqBDR8Fr7xRS7ZyHKCSCxPIsi/TJmFrW7YjueEurTaQtTko7vaKlmtXl39uCt9kszCJ5fDvYXqn6Gz1H30HpE3LRtNRSIsBVe4yABvVXDGTaSBYUtm6XkL1UmGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716850; c=relaxed/simple;
	bh=fIHdL745AHDexvPbgkhXw+cxoX3N43dLk6oZ/Ggxjz8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nObU3rpOlDe0+JEIsmAGfKQnVrZZYgUy/3yfjVlMuobfD9Ln+6687ubnGXrrr+xbfN4771pLpAXsoJE9h2ww10mkI3nfQ/Zie0aS0aDgvuVBVDnVwfZ+97nlIJxkQTLO01qXAv4H29T42YXEDwzGYG1xzv4OQEe87x6JA7XAIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRIsCI+w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRIsCI+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8171F00ADB;
	Fri, 14 Aug 2026 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786716834;
	bh=+bcbWdhEjG87MX2EDCpS7KjqQqoX5OV3WWLuViRbRgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VRIsCI+wsyEJPBVrNxqIkYblBa0FJMS39qhQqpJVSpaa68D+KRJoneTkVv9Wg01nK
	 +qyA6K77Yht+pbPVqui1YNP/9292nCif/6kF7yvT7ne4ZGaV6FExvwv2owHiZxFx5q
	 AEjiFLNWibXageWnmRHWprOz+aGcR64gT2twrAWt8V39APc24rl5j/PAdRmEiGCxDw
	 ZRr5tYhhaknltz5tF5igLnjglzhmOsgkf6d4b75sTSgxlMUYuFNNduZ++JCsD+JT4C
	 IutIJIsr13BP1wADQsVBbyYSSvKbDW8cvFSskjxprq4txm+DsrUeK8Kkv0V0LnjKw3
	 x5P5qtohP3Tog==
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
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
In-Reply-To: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com> (Mukesh
	Pilaniya's message of "Thu, 13 Aug 2026 12:36:29 +0530")
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
Date: Fri, 14 Aug 2026 16:13:49 +0200
Message-ID: <2vxzv79c23j6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 13 2026, Mukesh Pilaniya wrote:

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

Sounds fine in principle but can you please also share what the real
problem you face is and how changing these return codes helps? These
error codes are uAPI and while we _can_ change them as long as we don't
break something, there should be a clear motivation for doing so.

[...]

-- 
Regards,
Pratyush Yadav
