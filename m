Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571356;
	b=zieiHD117mEFqEHkoalPD7b23Csoy5a3HXGrlPb81Ks32cHl0v43yAfAAVqppIhKgbIH
	 yp5OeDge2zJlZIFF1/YCwvMFd8uB+95M4Cpn+BXQ9CQRrBGsjm+iSPfqLzzmPc1VFtq/t
	 FyO9pxFWFgiMFVc1DCwMoeBBuNTzkD8xlnGP1w3REYRh7zyJ7i1jTryoOer9DCl0HcMZz
	 adVu44fVhyh3rxu0f4x6dgMky7B2L/7/Asnbk40pCQMKlgWEeKgeRd9kXk+P9jU4fcwwO
	 rQRRGOZzOtU6c7xQP6Qdnn5FK42hcSBm5FkfvuZl6UnJJkM7/KQlWLr1bn7BZHKNnUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571356;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=W87d5476muuX3/O8DzYP4tAKHPl6gp8nviee8ooqz2c=;
	b=JtPoxQ7VVkJtr9b7guWUkz+VGmuGuXUNY1BbudEAmjDZU4uEZSw1r+Gz181oqpk5Nd84
	 54HruGIyI6gMKe/Y11dQs+L1kq+kCBAjVtNUEqilF0X/4Kj0B4WDz0Q7egURghJ71uyps
	 8gwMJ3EtonmvKSVUweb/L+mSPlOvgkPE1PKyYerWK1jx3VEZCry/aedtMg5+te082QnHp
	 BprDZ/FqRDhL3KrGgtt8SpJxuiYuwgPts+/UtQW8SEDRbs9GvOclm8FGRXWsIK30aqXUK
	 kHw/SJWLgCvB5v8pSseniCKw0tirc7NJfFnH3YbD80g/+S172xgtj+XNnoEGeXHJBLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmGl7Wg9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439A606A335;
	Sun,  1 Nov 2026 22:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmGl7Wg9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED961F00A20;
	Sun,  1 Nov 2026 22:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571356;
	bh=W87d5476muuX3/O8DzYP4tAKHPl6gp8nviee8ooqz2c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SmGl7Wg9g1RxLvPfW2dALi+8QfaputCLxqfCXXzYwQxYXBE+HvzPQgFDkM9HsWvTL
	 Xkkz0PMUmTmvi/9Cla9KrdHM8gMqSRVDrIS1Q2Awnl4sjtfhB9oKLuislGoFVvEj8h
	 B3b5eyTdD/3KWwfeuWkUb0b+N6f8Y8ngmSseQOZcfrUINE2oZehPMiqWOBxoVj7O9T
	 BRDW1sUwlnFaN3KWeyuMYiJv0qlIvtBeI6VC6WOVxEwu0HebGW+Scz5MniIlsKSd6F
	 Yy+z6qlaX0muqhV6dMFi4jyvg06S8qEnYCKjcUoFuToUfoPo6JQ/ZrhT1lyDNFTzVO
	 Loi5eGgGSeZJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0315838003B8;
	Sun,  1 Nov 2026 22:15:56 +0000 (UTC)
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
Subject: Re: [PATCH v3 0/2] kexec: fix probe error codes and error propagation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357135454.2624073.2428991164390583415.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:54 +0000
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
In-Reply-To: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ltao@redhat.com,
 prudo@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 kexec@lists.infradead.org, include@grrlz.net

Hello:

This series was applied to riscv/linux.git (fixes)
by Mike Rapoport (Microsoft) <rppt@kernel.org>:

On Fri, 21 Aug 2026 19:19:56 +0530 you wrote:
> While debugging a misleading error on s390x where kexec -s reported
> "syscall kexec_file_load not available" instead of the actual EINVAL
> from a kernel command line that exceeded the architecture limit, we
> found that some kexec image probe functions return -EINVAL instead of
> -ENOEXEC for format mismatches, and kexec_image_probe_default() has a
> bug where it returns whatever the last loader returned rather than
> always returning -ENOEXEC when no loader matches.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] kexec: return -ENOEXEC from image probe functions on mismatch
    https://git.kernel.org/riscv/c/2792b4b15f14
  - [v3,2/2] kexec: fix error propagation in kexec_image_probe_default()
    https://git.kernel.org/riscv/c/b7c94f4d0961

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


