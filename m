Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F06125
	for <loongarch@lists.linux.dev>; Mon,  5 Dec 2022 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1670260802;
	bh=X2KsP1+rAUDi2d9yRrjRBIlcARH9tha817/S+EuKjZg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JzKtZngcx6lTTlWrvUYEcZHdC7IXHTQTAIgvUJIE9oN9nOZ436y0L4zvCafeaDrYJ
	 SgEkRmH+Kn1djxSX5qrrywlnWW4DAXeUdL+J8+nss1mEJ3BmISPfAe6KJftN8ximQl
	 gkBQjNxhXjweyyaFgaLRVHNE4z+UxrSen3qFU6Ro=
Received: from [IPv6:240e:358:110c:2400:dc73:854d:832e:3] (unknown [IPv6:240e:358:110c:2400:dc73:854d:832e:3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1CA1E6683D;
	Mon,  5 Dec 2022 12:19:58 -0500 (EST)
Message-ID: <2ca97911066ddb8eedb46d75d5446f45156f65cd.camel@xry111.site>
Subject: Re: Question about 'ipmi_si IP I0001:00: There appears to be no BMC
 at this location'
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen
 <hengqi.chen@gmail.com>,  Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev, Dongyan Qian <dongyan0314@gmail.com>
Date: Tue, 06 Dec 2022 01:19:50 +0800
In-Reply-To: <CAAhV-H7F5R6gVR4KufBitusg5A++z-1cJjnMdNLCYg2EyzafLw@mail.gmail.com>
References: <20221204141027.2511383-1-hengqi.chen@gmail.com>
	 <CAAhV-H7F5R6gVR4KufBitusg5A++z-1cJjnMdNLCYg2EyzafLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2022-12-05 at 14:06 +0800, Huacai Chen wrote:
> On Sun, Dec 4, 2022 at 10:10 PM Hengqi Chen <hengqi.chen@gmail.com> wrote=
:
> >=20
> > Hi,
> >=20
> > I built the kernel using loongarch-next branch, had the following error=
s while booting the newly-built kernel:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 ACPI Error: No response from Global Lock hardw=
are, disabling lock (20220331/evglock-59)
> > =C2=A0=C2=A0=C2=A0=C2=A0 ipmi_si IP I0001:00: There appears to be no BM=
C at this location
> >=20
> > How can I fix it ? Thanks.
> This is "harmless", but I think Jianmin Lv can provide some detail inform=
ation.

"ACPI Error" is likely something imperfect in the firmware.  Such errors
frequently show up on x86/x86_64 systems because the vendors use a lot
of Windoge-specific hacks in the firmware code, but mostly harmless.

Also + firmware team member into CC list.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
