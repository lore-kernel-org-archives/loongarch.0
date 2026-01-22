Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BEC3DB756;
	Thu, 22 Jan 2026 23:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124526; cv=none; b=csmeMdYAXuKiNymnBavY07vG16HNYTNzy5ryB/XTG4RYEC23nqlfaQ1z52p0xDOn3NbigS5fNnJpJxTAu5Tdtk/7BnLPHl6+SD/Yxisv5Vm0n9OqWrG07cXPCl2uVejYJE6amU9udsrQ/qXXCYVV+biRKETH15X/yRVPEdKfkP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124526; c=relaxed/simple;
	bh=1rzoRxjBxb4BG5/p6nEiarc5sjUoR+CCCJcWpX6xZBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEHnwZyX34BCr1Oajj8qgsyV+i6h3PI7+z3XdZmOn17OLVvoZjCjnJjH3U/pLGcmxrHArMY6BTDIMieaztaptHnacEy3chf5OFFJ8QW3Xz+ABjvw9/6zunwn5cq1KsUoSx0Px4IKbHkXyFOje07+SCnGb6xwChlLcL1pR5h8Gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=gZQ8voLN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gZQ8voLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21401C116C6;
	Thu, 22 Jan 2026 23:28:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gZQ8voLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1769124520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAz0VE0aOXkTcnMsKZPcPLkEBbWRFSQ9zoUsrO3JsFA=;
	b=gZQ8voLNqP2wWMPrgAFFPQqM3dQtnQELPH8RWkZqlFaRd3tnhApMvte4sd3nU0Ql3XOzkx
	r7O/0h1mHbk5Z3LpYrJJT2rTcscRugiMW5k6hm1nduek7IWmiVHOrg8UD9fwD1yWt9p+cc
	JKaaRYWQ9EN9tFsCeDd2mcNJ+9jcJjQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 325b9127 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 22 Jan 2026 23:28:39 +0000 (UTC)
Date: Fri, 23 Jan 2026 00:28:32 +0100
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
Subject: Re: [PATCH 09/15] random: vDSO: Add explicit includes
Message-ID: <aXKyoETSE7G4PqmE@zx2c4.com>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
 <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>

On Wed, Jan 14, 2026 at 09:01:41AM +0100, Thomas Weißschuh wrote:
> Various used symbols are only visible through transitive includes.
> These transitive includes are about to go away.
> 
> Explicitly include the necessary headers.

Please lowercase the subject line. Otherwise,

Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
