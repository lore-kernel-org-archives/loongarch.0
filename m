Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD7331207;
	Thu, 22 Jan 2026 23:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124562; cv=none; b=Msj/NPcOCMK8rAZUXV7ca3Cbi6FiM82Ls5kN8i/e1wAxht8/7mlIPM7elh6KDftPJjBs6j5me+MI3rm896mEAwpZU16Vf/2DDy87ANWGvQdBi7vlLNd7RhRT3UTs/DOcpNhMoM/QySqS/owIRBy7bgDJsS+u1fUBXfALJWe0+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124562; c=relaxed/simple;
	bh=HVRfT0Ih5P7Z9ykq52t7bKob1JYatgKMob99QsBLkFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+X0KFa7WnXFWGh00aDHDt4wwYG7SeJWSv4H1YyXsbEbDnWaX/FIO9CsN6/bpGtXROsgMINHrPvrSF/s1JvdMgoRFkB6hN4WIEvT0y+dM0vrMIaXCEl3izYMHIECm05CbZdwE+bkI9UQ3Au749xh4QKL/B759e0MzR+viwXVEJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=AR0pJ+JM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AR0pJ+JM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B31C116C6;
	Thu, 22 Jan 2026 23:29:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AR0pJ+JM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1769124557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kf/+wm9T8K+0mpA0ud88MFs+EQUKYAWohz0EXddAFIo=;
	b=AR0pJ+JMGvnU92uFTU2T54v518VZAvj/JhSPeH2ruQ2iUnWODCMzwcyklRasNyjc5Nirfc
	hjplmDuzJ7dqi5gWcnTH9DnHPuorX8VguNrcy3/iL6SFHksUcHvzRrHBIlaMQhqWQWghLd
	CzN32ZUihqTaUd1w5/EzDixALWTTABY=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3fea361c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 22 Jan 2026 23:29:17 +0000 (UTC)
Date: Fri, 23 Jan 2026 00:29:10 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
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
	Theodore Ts'o <tytso@mit.edu>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH 15/15] random: vDSO: remove ifdeffery
Message-ID: <aXKyxviscQhQlGig@zx2c4.com>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
 <20260114-vdso-header-cleanups-v1-15-803b80ee97b4@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-vdso-header-cleanups-v1-15-803b80ee97b4@linutronix.de>

On Wed, Jan 14, 2026 at 09:01:47AM +0100, Thomas Weißschuh wrote:
> Recent cleanups of the vDSO headers allow the unconditional inclusion of
> vdso/datapage.h and the declarations it provides. This also means that
> the declaration of vdso_k_rng_data is always visible and its usage does
> not need to be guarded by ifdefs anymore. Instead use IS_ENABLED().
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
