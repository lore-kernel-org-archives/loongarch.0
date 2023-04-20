Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1C31FD3
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 04:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1681964932;
	bh=qjJvhRPJtTB9s4JlA/d32awcwTdfGFqpmvhyPup6Wc8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PX8JwbhZLO8D/l7LmC2fOX9ytOGvUVJ9EOfaiI/asRKpWeIcsq52EOOtOcjL4xGX3
	 Cm7vIEg1QTGA+PCU/mGiwKCKnSfberDERsRTbGMR3lIh1UFoBgiWKJ/JN1yNwOV9bg
	 ve/iK0dphdPBJg66mXWEqNhRuzNBiP+FK9GWJat8=
Received: from [IPv6:240e:358:116f:3d00:dc73:854d:832e:2] (unknown [IPv6:240e:358:116f:3d00:dc73:854d:832e:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id DCE7C663E6;
	Thu, 20 Apr 2023 00:28:48 -0400 (EDT)
Message-ID: <4c8bd175b3749631ebd3ab1b70693b3f7e748c69.camel@xry111.site>
Subject: Re: [PATCH 1/2] LoongArch: Add pad structure members for explicit
 alignment
From: Xi Ruoyao <xry111@xry111.site>
To: Qing Zhang <zhangqing@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 20 Apr 2023 12:28:43 +0800
In-Reply-To: <51051bd7e42378cdf465494389ab76a30ca3acf2.camel@xry111.site>
References: <20230418091348.9239-1-zhangqing@loongson.cn>
	 <a7fa32c3af68083855e7690f67824d060d5c6135.camel@xry111.site>
	 <899085c1-7a74-8bab-1429-1b6e9e4c2c30@xen0n.name>
	 <48bc7236-638d-9086-daaf-62eacea80dd2@xen0n.name>
	 <111c1e81-dfae-4388-9fc6-a3f247641398@loongson.cn>
	 <51051bd7e42378cdf465494389ab76a30ca3acf2.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-04-20 at 12:24 +0800, Xi Ruoyao wrote:
> undefined behavior.=C2=A0 `printf(PRIu16 "\n", ptr->dbg_info);` is an
> undefined behavior if ptr->dbg_info is a int16_t, because the standard
                                           ^^^^^^^ uint64_t

:(

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
