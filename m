Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35B433042
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 19:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663734; cv=none; b=al/qjQNTHx4e7yU07se/KtQEPv+OvvA0E7Z0hH9nb1r7f1ibNvPaYMz1rOP49Xum77xDC+m6wKPJ13Q4u/1BDxXTbDxfJW6JvtfoRng+LmPAvBcslFYeDWVCTQSwZwchDSf5/wK3T1nRlvQR+wij3ypSmoMpzLD/N3aHTdK5G7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663734; c=relaxed/simple;
	bh=OSVca3K2RdhXUQ1PWj+BwLEsCMnTBfJCxjNhQBtZdZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7+3dXdeARXsFH9v/yqFk0ghABYjUVXBhU8cm+aWuqlhTYni1zjjLY67pZZzZnM5gVwPqEwtmtqGrYllmHpROZG44yvy9q0fiTbUeTOztSeg6oCyCCkw3+8Y4jGTGbEH2d0j+I1S59mZ0c6iC151zyPhn2+TU6+h0h9m6Xrzbkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Xran02uK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Xran02uK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 72DC140E00E6;
	Tue, 21 Jul 2026 19:55:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BFh35W6ojD13; Tue, 21 Jul 2026 19:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784663720; bh=mHZ6KR0HBY/A+4ayC9BCwjfVh3BlnXge75QXQoZQPFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xran02uKyC5edtPpDYP3zrYWvM/wd+TuG8TczFdXanmHqJhF4EQsJramNEgpUqMwo
	 qKjV7yxLOGcs3wwnXmjjsCK5Wsw3coj0OmWWhxSEvMj6q5BqKwChVtk+5XngQLUbCr
	 /O1lX0OhBtGD757bPtSiNIuD8gDwKolYacrfjk729yTU/wd41XvJ+Txnbfg+WR8ucu
	 ZpiWXmpQ5StCU0PcoZvEj867IEcdyNscwc/HZQrbWpF4lscz3jaXE7vdz8WjzoJQfL
	 GDpLxjoBWUV0QWk2qVOLe/DigHevMVj41j2DrfnWbCar8FMZNrvwr3ceq+FvFEtLNw
	 rekRCUCLPFqCLIs4bS3oJFRNFimbOqu5sqM4nf0pMGmLcuR9HFD3php75HDfUvDgiN
	 G3IRK97tDDj5J+3sEGwfflva1Z+sNvEsTc+mALCDIjJ399i+n5nWTNTnzk1l1NCNT7
	 JP0i3sSqMhy7J5xHbWKX0Ki3IvtL51oonXbpv3Xo8OESr1ABKFqZPkXBIXMKwWkrRE
	 YxiTGeQOVesK2TUnUn9AIBV5+Z3L52z/SIJ2k0j6W0aaosNAqJwgh897ftzD+uInQh
	 31m6kPgkYEz4Z4fslke2woWDCwHQLFhtW8IJVLJ7H12rRG/CN+c6+j3GaBs5bmc3Ng
	 XIgXGRuajM3fuCnBC+JRBOxs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C109E40E016E;
	Tue, 21 Jul 2026 19:54:48 +0000 (UTC)
Date: Tue, 21 Jul 2026 12:54:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <20260721195446.GHal_OhkuBCWQjmLQW@fat_crate.local>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
 <al-6aLMJONOMfW2v@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al-6aLMJONOMfW2v@kernel.org>

On Tue, Jul 21, 2026 at 09:28:56PM +0300, Mike Rapoport wrote:
> I'll take it via the memblock tree? ;-)

Definitely not.

Unless you folks want to carve out the bits of set_memory.c which interact
with core mm and mark it as maintained by someone else. I personally don't
mind too much.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
