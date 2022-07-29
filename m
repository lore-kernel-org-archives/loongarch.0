Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824931360
	for <loongarch@lists.linux.dev>; Fri, 29 Jul 2022 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1659095111;
	bh=H8GNgBXKqA2DTQwH2JxXCeNpjsYFe/n4yg8c9Eu2la4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iB/7gdkVmEHsdQBBdvRH8dt+fLQzhg9QcCqMt2e0FShZcL+mnxkdbKS2+BXc0HiGV
	 pdzZLYvgwDZWhYdNoldSRAXv6Ws4ANRCc9ZHHBlUXy9Sd2tyjBlHSrq/QPVw+I7cqp
	 Gz73AwCyu2Lm7EL07IxivrZbwrnVjQgE4Q9TAi1o=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3F632667DC;
	Fri, 29 Jul 2022 07:45:09 -0400 (EDT)
Message-ID: <6b5d2188f93ed72b67a4bbb7116113f833fe1ee5.camel@xry111.site>
Subject: Re: [PATCH v4 0/4] LoongArch: Support new relocation types
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Huacai
 Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>, Lulu
 Cheng <chenglulu@loongson.cn>
Date: Fri, 29 Jul 2022 19:45:07 +0800
In-Reply-To: <a139a8475fe295ac9f17064269cd0312dca6f96e.camel@xry111.site>
References: <32a74a218c76611f897fd1df1ad0059068621133.camel@xry111.site>
	 <ec52fd49-4a30-15d9-3d32-fd7bc6d8b3f0@loongson.cn>
	 <0179679b736aea7258981dec2d83107cce74dfc1.camel@xry111.site>
	 <a139a8475fe295ac9f17064269cd0312dca6f96e.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2022-07-29 at 18:36 +0800, Xi Ruoyao wrote:

> The relocation against local percpu variable is broken up.=C2=A0 I'll try
> to fix it.

Hmm... The problem is the "addresses" of per-cpu symbols are faked: they
are actually offsets from $r21.  So we can't just load such an offset
with PCALA addressing.

It looks like we'll need to introduce an attribute for GCC to make an=20
variable "must be addressed via GOT", and add the attribute into
PER_CPU_ATTRIBUTES.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
