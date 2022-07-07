Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42683362
	for <loongarch@lists.linux.dev>; Thu,  7 Jul 2022 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1657179948;
	bh=cbRzgqE299OGjst4cdDDB54VzabovIvIWbmrnbVjnmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=f85xisskp2lirRCrVnNcVwnxi5YosIcQe/sALTLj0Fx+pL3fyEJcT3Nkv4LGnvuWi
	 1dU/npD5lzAL24bDHQliQoZzYeFixop7su5AtnFPE1hqihSOlbcpYQwzkJ2Qh81Pvb
	 W7sIixJa3ity+1kWb5pvkBvT9FS3/8tMfKv92Q5w=
Received: from [IPv6:240e:358:1189:2600:dc73:854d:832e:4] (unknown [IPv6:240e:358:1189:2600:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 58DCF65926;
	Thu,  7 Jul 2022 03:45:39 -0400 (EDT)
Message-ID: <22646b550278e76f395c934fe36a1ac55ae05533.camel@xry111.site>
Subject: Re: [PATCH v3] LoongArch: Remove vcsr in loongarch_fpu
From: Xi Ruoyao <xry111@xry111.site>
To: Qi Hu <huqi@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Date: Thu, 07 Jul 2022 15:45:27 +0800
In-Reply-To: <8a9cd14a-54ed-cd2b-88ad-647a43b09d0e@loongson.cn>
References: <20220706112937.1218573-1-huqi@loongson.cn>
	 <CAAhV-H6MHjzdwyZqk6a3sKByRofG1Th6QEk0Be5NBhiAsVNcTg@mail.gmail.com>
	 <8a9cd14a-54ed-cd2b-88ad-647a43b09d0e@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-07-07 at 15:35 +0800, Qi Hu wrote:

> Remove VCSR from "loongarch_fpu" which is used for debugging.

"was" :).  And it's better to at least add something like "before 3A5000
retailed".
>=20

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
