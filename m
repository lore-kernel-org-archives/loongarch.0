Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571355;
	b=15mBFUgC56GwOMUeqhski/8Dd3QmRBy2WDoQWxctqJscLQpHA8p57BIYPe9EL8Hwod+g
	 ISyrN7c9FqraFHe/QTmfzYNO3kwQg4/77fjBA106RqCXvgqr9ENGoLHFQfu9B4Ftuj2Nq
	 O9q22EfcYvQbTDN7wfYzzWHXbW6ReuI1DGg+L1jgmnV6KdSMv59u068GVsuImQjr9q6sS
	 93SoHgo7bvsL/Gtq+p03wtxzdUK/WDiOsD/GBKqb9fnodHLuDqs0bs7oqlxdOJJHC7UUp
	 /MVWPyMIo0bM8B10jTE7n7QcJ5TmVMNy3vuhzi9KtFDPQcWOKvAAT1TRED2TjJU/cCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571355;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=NtvSLxCeAfOoCPUcLXijhf4eopOStWrRuZXjlGTbL0Y=;
	b=SiMkKmqRMsiAgqKOxyeGS+PmjkqhUjONBN+lzrPzi9/90VJPWyaTvX3zsteM2WecaMlS
	 NKMIwP3jDiUWroh7v7qUSmGttdJBZd9XFdtaBeZTwJzyWNsTgJlS9oDqfN1qsZUUAmLZi
	 u6t549omhk0hrQWJ/q7zKC9DdSuxIKfHPEcZNOHSNBlOF2jDwwHKmi3igPvDG/GshvU4P
	 zf9DTEkzVb3HfwJyGB4v9twXPgSMgM/3OLh27UonFMQu00pxCf5IcRG8L4bSA19dDLI7h
	 noMJYQk7w7bXqiUmzxm6vdf/r15lJOmUfdHecgdkD1thfUtcAlX272ftVwURSfuri2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKoBexQh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB8D606A330;
	Sun,  1 Nov 2026 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKoBexQh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D121F00A02;
	Sun,  1 Nov 2026 22:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571354;
	bh=NtvSLxCeAfOoCPUcLXijhf4eopOStWrRuZXjlGTbL0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZKoBexQhRXRdf4UMV5kLb9mnk7bxuTeU9/aOxjsdVCuZzJfHLn+5n4iKhY/oUvoLp
	 JVlIk4OSC46FGW/cqROShhBfR0LCiGtieNG3r2bP4+vQJKQQN6avAsI3VexTFYEc6H
	 HeqNJOYNac6pTBjs08uHalbq9/cCo6b4M6EJbRyY8db+P5Yb+nJ89MfGrKvDO/DvqA
	 EWV32KMLhX7VyAZUZh9xWUqV88A96fOJFPJbNBsWYVqdUjgIvMvML58c4FLKcoe6ME
	 onFhhkTXSYOw8AndRXgJz1clc6dTs2kPPNm3il6xlWAexBttRJ6fQAlrv66HQgZ0KI
	 /vAjPn1nOn1zQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D3C738003B8;
	Sun,  1 Nov 2026 22:15:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357135307.2624073.4721839203390727689.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:53 +0000
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
In-Reply-To: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ltao@redhat.com,
 prudo@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 kexec@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Mike Rapoport (Microsoft) <rppt@kernel.org>:

On Thu, 13 Aug 2026 12:36:29 +0530 you wrote:
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
> [...]

Here is the summary with links:
  - kexec: return -ENOEXEC from image probe functions on mismatch
    https://git.kernel.org/riscv/c/2792b4b15f14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


