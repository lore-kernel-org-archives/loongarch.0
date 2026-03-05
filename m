Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FD53358B0;
	Thu,  5 Mar 2026 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772742126; cv=none; b=hnBY/sosHBt1TXNdlBleVgMRntXgfVcsn7Y6eycawu1GuwnHhqUyDQTWBihwKPijIILtiAYJ7jwvqeRuNPxAyqIptjX35qhuQWbmejbiFTxLE7z7QGGeq22Oj7XDjW/TkpDXgbtKtbhuEcrwj81Mzx8Mhy5JxePyOSYe7xhe3zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772742126; c=relaxed/simple;
	bh=p9SLojOBSqlkRosyKhEeBokvTC98E7rdJMjHdKAKKC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMUyy73kQR3Fg0maPJVfQQInqZ4J+InQ22Lc54rB2bD/l/Kh52uHC8mcYGLs/gbfestsEd5xihLzN49yS+phevWyT0nNgTyaZp4bkw18KDcM8NGvprtq5uq9rswhNp3VA3gW7FFIRsKx3rGJ0nJa5diejwknd4CEB1fai81lYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPkmB1Li; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPkmB1Li"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C1BC116C6;
	Thu,  5 Mar 2026 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772742126;
	bh=p9SLojOBSqlkRosyKhEeBokvTC98E7rdJMjHdKAKKC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPkmB1LiQs7gd5CVa7SJaO+vqAmkZ+r/LcL1KDErwRBukeywIr5d29izyTu5Je0ov
	 1Cx/66pYIe09lg2rYM2/S1EuB3kL80U5/ziuVpp/3Lxgj4c3sIxSDo2H8y+lmExEEv
	 JtTPDmhfkUhaAtgeigLgibFwVc/WgSUPIFKnGPRe/G/MDpSwfDXzZ5fp7gyYIfZ/sl
	 XQ0mM2mAOY/g6aCBrfTzjy1/uORdW9bUNontWvjBc5J/jjeueS5oXHTjYz84tT8jEW
	 kLxzP1rOACc1UIZOggkexLO3B8bChNTBj8ptCs2w7HgCe67IHW2Vof0c6mX2nKqPoE
	 Hx/E1j/sPl9wA==
Date: Thu, 5 Mar 2026 12:22:03 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nouveau Dev <nouveau@lists.freedesktop.org>
Subject: Re: loongarch64 objtool warning with LLVM 18 in Rust object file
Message-ID: <6h2zrsl7xsjd4pa7e7cgtrprez55f2eioc6c652fwnxmadrr72@qe5g6yf7otrx>
References: <CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
 <9bb8b1ae61ccebec6460e2b271cbcc709aba9765.camel@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bb8b1ae61ccebec6460e2b271cbcc709aba9765.camel@xry111.site>

On Mon, Mar 02, 2026 at 10:22:20AM +0800, Xi Ruoyao wrote:
> On Mon, 2026-03-02 at 00:42 +0100, Miguel Ojeda wrote:
> > Hi objtool & loongarch,
> > 
> > I noticed an objtool warning in a Rust object file for loongarch64 in
> > mainline:
> > 
> > drivers/gpu/nova-core/nova_core.o: warning: objtool:
> > _RNvMs1_NtNtCs3LxSlPxFOnk_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x238:
> > return with modified stack frame
> > 
> > From a quick test, I saw it happened only with older upstream Rust
> > binaries (1.78.0 to 1.81.0), so I suspected a switch of major LLVM
> > version, and indeed with 1.82.0 LLVM 19 is used instead of LLVM 18.
> 
> /* snip */
> 
> > While with LLVM 19 I get:
> 
> /* snip */
> 
> >     lu12i.w         $a2, 1
> >     ori             $a2, $a2, 0x870
> >     sub.d           $sp, $sp, $a2
> >     ...
> >     lu12i.w         $a0, 1
> >     ori             $a0, $a0, 0x870
> >     add.d           $sp, $sp, $a0
> 
> /* snip */
> > 
> > So I suspect the stack pointer is not getting tracked properly and
> > thus the mismatch. Is it a known limitation for `objtool` on
> > loongarch64?
> 
> It indeed looks like objtool cannot handle the sp update using a scratch
> register above.

Indeed.  And I suspect the scratch register is only needed here due to
the extremely large stack allocation?

We could teach objtool to handle this situation, though maybe some kind
of warning is actually a good thing since it found this stack usage
issue, albeit cryptically.

-- 
Josh
