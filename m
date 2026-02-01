Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE22253A0
	for <loongarch@lists.linux.dev>; Sun,  1 Feb 2026 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769930403; cv=none; b=fZIK/7ah5/3+52Uu/Rxc2avhb/M+d0ZHV7nLmlAh5miy7Pp7stOIL/AcQMYNVsiz/KDYYFm0RPjVz5v2j5TG5Gs67qSDao2uth4uJWHxOmRnHoO8/BStqbqnUcjo+VaGGzMr5JfmUFqkJliBbdKH5ckewMOTnzSgcu9tzUzjHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769930403; c=relaxed/simple;
	bh=9s+3WVvT3Al9aQDHgDVvazZosygQtOMziXmEVzH+x7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKyUNHcuPj6p4gj8WHDUTOR8xi1ydbvFci5bN1pifHMKdv2HwMPv6v8VndyNCaR9FbAKnDBMzSkwBbkFHhqLL4lNr/ClqQ6RfDH8OeCDLxL3Fmj+/S+ASwk7Ayd0QVPeS+McoWz3mvun1xU9BHFueDi2Dw36GOUboGKJmUKLbaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktt92Rxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktt92Rxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C35C2BC86
	for <loongarch@lists.linux.dev>; Sun,  1 Feb 2026 07:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769930402;
	bh=9s+3WVvT3Al9aQDHgDVvazZosygQtOMziXmEVzH+x7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ktt92RxmgcRr685AKch9FYUPSLONxviGs0qRxxA/RGKcNwhUXRb1Ym8EKcRh6C+2Y
	 Br+gO+M7SA2YkDY49WxWh71+KLUWAG5hUfc+Eakwcjji3x0TNIKS7dl45ogCJMl0tu
	 uG5QSkAyr2D9sGxL3n8X9mmT4JZy81hzwdEeUIIcGU/RyWbtpnc7XhLzCNQhlLAROc
	 b4hZyHmb9vM5g9ahD+rBDphLhdLKYYGOn/7W/gmmNM/qNkm9V+pXmr3VHP3AQFExwb
	 FWQxojDE0CM0FJL2yASarAtUdLUwlOFyUVO+ZSAR8dXfWkojsxytzd6nxpRlP46Y98
	 zWbn/NOmDTZ/Q==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b886fc047d5so645178866b.3
        for <loongarch@lists.linux.dev>; Sat, 31 Jan 2026 23:20:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1+YHwCBlAuDI/eeS3rzFoPavqOfBq2iziWjNIyeNQ5K+CBX8pn2p+vUK1WtnClMkbYzVdgtwF1Ms=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoZBA1+g7Qd+hnE1tby07qwy+o/gjsOlKe/igcXZczJYS3AXbe
	FbrdZmM7H8SaquwLY6lvi3IabrdN6AdPCpQStG4ipszOnjr8eJyzi/i6lp0j8TfZm+3U6RYzk7+
	Vj7KgkHd+vxKjHmftbHCEXnhNm6KbzXk=
X-Received: by 2002:a17:907:3f91:b0:b87:5c45:b884 with SMTP id
 a640c23a62f3a-b8dff652e78mr466636766b.31.1769930401415; Sat, 31 Jan 2026
 23:20:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260201023619.366505-1-chenhuacai@loongson.cn> <aX7Z-ZjXvhNa3Wsp@pie>
In-Reply-To: <aX7Z-ZjXvhNa3Wsp@pie>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Feb 2026 15:19:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4BsGLqGa0CMMLwRpOaV9d5OQ3YF+hb-P=pGRhMhScJ1Q@mail.gmail.com>
X-Gm-Features: AZwV_QgEn5RQ8Co-v26k_Tiz7EQERdm4EyH_HkuMfR4QfZA7U5K-PXk-4zXl0VM
Message-ID: <CAAhV-H4BsGLqGa0CMMLwRpOaV9d5OQ3YF+hb-P=pGRhMhScJ1Q@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: Correct spelling from clk_scr_i to clk_csr_i
To: Yao Zi <me@ziyao.cc>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yanteng Si <si.yanteng@linux.dev>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Serge Semin <fancer.lancer@gmail.com>, loongarch@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 12:44=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> On Sun, Feb 01, 2026 at 10:36:19AM +0800, Huacai Chen wrote:
> > In include/linux/stmmac.h clk_csr_i is spelled as clk_scr_i by mistake,
> > so correct it.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  include/linux/stmmac.h | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index f1054b9c2d8a..1ba583ef6e03 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -28,14 +28,14 @@
> >   * This could also be configured at run time using CPU freq framework.=
 */
> >
> >  /* MDC Clock Selection define*/
> > -#define      STMMAC_CSR_60_100M      0x0     /* MDC =3D clk_scr_i/42 *=
/
> > -#define      STMMAC_CSR_100_150M     0x1     /* MDC =3D clk_scr_i/62 *=
/
> > -#define      STMMAC_CSR_20_35M       0x2     /* MDC =3D clk_scr_i/16 *=
/
> > -#define      STMMAC_CSR_35_60M       0x3     /* MDC =3D clk_scr_i/26 *=
/
> > -#define      STMMAC_CSR_150_250M     0x4     /* MDC =3D clk_scr_i/102 =
*/
> > -#define      STMMAC_CSR_250_300M     0x5     /* MDC =3D clk_scr_i/124 =
*/
> > -#define      STMMAC_CSR_300_500M     0x6     /* MDC =3D clk_scr_i/204 =
*/
> > -#define      STMMAC_CSR_500_800M     0x7     /* MDC =3D clk_scr_i/324 =
*/
> > +#define      STMMAC_CSR_60_100M      0x0     /* MDC =3D clk_csr_i/42 *=
/
> > +#define      STMMAC_CSR_100_150M     0x1     /* MDC =3D clk_csr_i/62 *=
/
> > +#define      STMMAC_CSR_20_35M       0x2     /* MDC =3D clk_csr_i/16 *=
/
> > +#define      STMMAC_CSR_35_60M       0x3     /* MDC =3D clk_csr_i/26 *=
/
> > +#define      STMMAC_CSR_150_250M     0x4     /* MDC =3D clk_csr_i/102 =
*/
> > +#define      STMMAC_CSR_250_300M     0x5     /* MDC =3D clk_csr_i/124 =
*/
> > +#define      STMMAC_CSR_300_500M     0x6     /* MDC =3D clk_csr_i/204 =
*/
> > +#define      STMMAC_CSR_500_800M     0x7     /* MDC =3D clk_csr_i/324 =
*/
>
> This seems only a fix to typo in comments, instead of real functionality
> bugs, should this be backported?
I think it is worthy, but the maintainer is free to remove "Cc stable".

Huacai

>
> > It must either fix a real bug that bothers people or just add a device
> > ID. To elaborate on the former:
> > ...
> > - No =E2=80=9Ctrivial=E2=80=9D fixes without benefit for users (spellin=
g changes,
> >   whitespace cleanups, etc).[1]
>
> >  /* MTL algorithms identifiers */
> >  #define MTL_TX_ALGORITHM_WRR 0x0
> > --
> > 2.47.3
> >
> >
>
> Regards,
> Yao Zi
>
> [1]: https://docs.kernel.org/6.15/process/stable-kernel-rules.html
>
