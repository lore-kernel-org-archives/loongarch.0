Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57136E
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 04:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F6CC433D2;
	Wed,  8 Feb 2023 04:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675830881;
	bh=4k0z016/iHjCs1BDnqiYDbywfs5X6P3jlRX0SG1FS1o=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=aHceHnD9PbGUAQbaBfV3/hpRSvnVXJVak5nbRAiqWv/y9LC8vHIrOKdCVgk8ipWCY
	 x4qh7AUboskPVsXJrddZ2tGFKXJARj5EIhBzgqo2CF5NSK7Lgqf39L4SdXFIwxsQQ6
	 WvfGZPvo3gEfBAVXItDJlUwKjkylt+1Flb/9oELhcnouhHUjBirzIefEr64WZqVmGn
	 tLQt3T6+ekEkhuGohJU7IGPCSx2FUP8F9BPTarlsBJmd+t9CAsuiOSP4wH/LTio9Fm
	 C0mXOC3zeeOVfLY4UruQCgFrryESoOsyf0U4hCJ+O/TD+lELlXe9DUdVqwWohx0pCS
	 Nd6/7tT30XT1g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E61985C08F3; Tue,  7 Feb 2023 20:34:40 -0800 (PST)
Date: Tue, 7 Feb 2023 20:34:40 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: chris.chenfeiyang@gmail.com, Feiyang Chen <chenfeiyang@loongson.cn>,
	chenhuacai@kernel.org, jiaxun.yang@flygoat.com, arnd@arndb.de,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/nolibc: Add support for LoongArch
Message-ID: <20230208043440.GA3164268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <cover.1675734681.git.chenfeiyang@loongson.cn>
 <2d77fe4e895847ae1ea09088dcfa411ce2f57f5f.1675734681.git.chenfeiyang@loongson.cn>
 <Y+Mc37ACt0PUBRAQ@1wt.eu>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Mc37ACt0PUBRAQ@1wt.eu>

On Wed, Feb 08, 2023 at 04:54:07AM +0100, Willy Tarreau wrote:
> On Tue, Feb 07, 2023 at 10:09:42AM +0800, chris.chenfeiyang@gmail.com wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> > 
> > Add support for LoongArch (64 bit) to nolibc selftest.
> 
> Please also mention in this one that the makefile was reindented with
> no other change than adding entries for loongarch, this will save
> those reading this patch later from checking that the rest was not
> changed.

I like Willy's suggestion, but even better would be to put the whitespace
changes into one commit, and the code changes into another commit.
This makes it a lot easier for reviewers and future nolibc developers
to quickly and easily see exactly what changed.

And one of those future nolibc maintainers just might be you!  ;-)

							Thanx, Paul
