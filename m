Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0522E7C
	for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1679488299;
	bh=lYaDipbtxIMAoO10xt/j4xmgIh6UWIJGyR2Ng2GKQCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YD7YGZvbn2hqmauN6XwQad5YmIQ8auVrQy23rlo0MJtcvCWGXQXBEn96JGb4k63r+
	 ZPS5Ngx4X9EFcEPPpj9M/Hq4NH93jCAkOcn8sn7aoanVZ515C/Unai0RKNRbnlZMAK
	 khCPukU1ElWDedmYH7U2tYypMRJt7wM+Mo2sgb/w=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 60406662C3;
	Wed, 22 Mar 2023 08:31:37 -0400 (EDT)
Message-ID: <9a75c293c76682c7bc36cc39b8070a5b8051ca63.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Enze Li <lienze@kylinos.cn>, 
	chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Wed, 22 Mar 2023 20:31:34 +0800
In-Reply-To: <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
	 <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-03-22 at 19:09 +0800, WANG Xuerui wrote:
> > The main problem is that, the lscpu only identifies the data by its
> > "model name" field.=C2=A0 However, on the LoongArch platform, only 'Mod=
el
> > Name' is provided, which cannot be accurately identified due to case
> > sensitivity issues.=C2=A0 And I think that must be an oversight.

I tried using strcasecmp() in lscpu-cputype.c but it makes many tests
miserably fail and there is no trivial way to fix.

I guess I'll just add LoongArch special cases there :(.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
