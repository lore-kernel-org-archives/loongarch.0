Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F093043DC
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227482; cv=none; b=sxKrld6KgXfnKpE5wlDQi0iG9cvvMs4UKTzsx8pvQJpq5jB7icS9nDvZOl5cUbGUylOhrvkR/usAEd8ky90wbgpluvaZ9yyqN+iLlYvM/tvRQAxGU3mf3my7NQc6VPRcrePesq1f2Kx25WOy2gma9Mzj8QeTq1ARXYV1bPOc1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227482; c=relaxed/simple;
	bh=G1ls1ovLla0PwhNu7yYxNroPct7rquwUYRb7LHfE7+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpbEFxyY4Gx0L/2zx3GdfXWUUsotGy9j4u+1maEtyCam2rxkhRUEtvdyxXqxJgxg4Ew9kM7GJ/m3U7Cmvi6jL9S/SJtelbKjZn1nyIHNhvCHxK9/ag9rgHsx3PGeujKNjA/Q6KdV9jkjU96VVKOLSemNsnbsM3vV+ufznwqSQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 678371516;
	Wed,  4 Feb 2026 09:51:15 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EC233F778;
	Wed,  4 Feb 2026 09:51:18 -0800 (PST)
Date: Wed, 4 Feb 2026 17:51:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 02/15] arm64: vDSO: compat_gettimeofday: Add explicit
 includes
Message-ID: <aYOHEzX4Djcui5vO@arm.com>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
 <20260114-vdso-header-cleanups-v1-2-803b80ee97b4@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-vdso-header-cleanups-v1-2-803b80ee97b4@linutronix.de>

On Wed, Jan 14, 2026 at 09:01:34AM +0100, Thomas Weiﬂschuh wrote:
> The reference to VDSO_CLOCKMODE_ARCHTIMER requires vdso/clocksource.h and
> 'struct old_timespec32' requires vdso/time32.h. Currently these headers
> are included transitively, but those transitive inclusions are about to go
> away.
> 
> Explicitly include the headers.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
