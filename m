Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0B2586C3
	for <loongarch@lists.linux.dev>; Wed, 23 Apr 2025 01:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745370117; cv=none; b=Mrtq+OOV24f5NjyfIlL9iuq6mnQeZv65WW6QrQTk93r2HHH46Orqu3opuUQudozZE+s9hXJglOyUOsFG2t3z+rHcysclMclAZv5OZWEWX00CnozFP+kwSy0VLwzzxarN0QEK6OUaoAx0CBkAoX2nDuO/FD6flgm4Bo0/dDP7tX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745370117; c=relaxed/simple;
	bh=MGbPXiW4nYV+zqOefAawrUbkXEem0Jp3jVqvvM3VUzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZJseSGlsq7NsucbzqatYjWr1V/wDK06dHwzHBr059APnpUtvlhAyFNOpu4eAJ0Q1ei5zw207hehDbKItinN12mRdf19SwCzG9zz0gK941gkOiRPFn9v6e3UZPU+OBhih7z5+XxxynG+CkpVVu/qLTbSxmQnWf/GxNK71aq7pSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLZ8m3+Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLZ8m3+Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA334C4CEEE
	for <loongarch@lists.linux.dev>; Wed, 23 Apr 2025 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745370116;
	bh=MGbPXiW4nYV+zqOefAawrUbkXEem0Jp3jVqvvM3VUzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XLZ8m3+ZXfsDqJmdi6t0MuEC0AMi39SgISd9IxSp8DDqmFrL7+x+yxhTxBvqgwT7E
	 UHXXDMzi/UjfRvjxFISyygT5Yan9OEtNSBu53KyRRa06/Kt6lPfCYX+zURmBpUOQmp
	 YqtHxbrZSVRzqZGByBVpi75igzbEtWW6xFn1RUDjnM9Fcg5uIZtFMZgvzuNa0b+AB0
	 9i1lKm2f0BCvx+zeQRGQzg3xLviA9+wEfz7kd3cWoGUWrGYBq3YrvD8U9OQBXPh/2d
	 NwQsic8A3VulBHP1NJMvI6/vVaaB0hQU26dFUN5Knh51yb5lmvlut5i8HcUX9lf9FR
	 EQ8OoBx4ZmI/Q==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25d2b2354so831191666b.1
        for <loongarch@lists.linux.dev>; Tue, 22 Apr 2025 18:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqEAfoh7Or6LLESDYxSll1/BUKyY9uw6jcZR10gf+iC+Ui8W6MAyXB3feM2Sr14DvR44Wb97CaBJE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzT6WAwzf3u3lSr8qeVeSyoUvnt5d8rvLZ0jPzMX0bmDf0oR58m
	RPl0GGZWg0AYnnQww8nkZAOm+ioB5DFGltiqdV7SequdEmw6CpURis6IVT8pTpTkBfOVuPzuLr7
	KwfEAL6dLzg+X4lR2Ayr6z3Qg6Oc=
X-Google-Smtp-Source: AGHT+IFmOqFprNvXKjhlL+mH7JCjSOPD9Sd9LOXsLFEcq5n3t5ZXVfO0rZboDAM2ZHI8hxFfupsHfi0/0yZrtBJKmoU=
X-Received: by 2002:a17:907:7288:b0:aca:a383:b0c9 with SMTP id
 a640c23a62f3a-acb74afba44mr1547979266b.13.1745370114471; Tue, 22 Apr 2025
 18:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416144132.3857990-1-chenhuacai@loongson.cn>
 <20250416144132.3857990-3-chenhuacai@loongson.cn> <fe0a5e7a-6bb2-45ef-8172-c06684885b36@linux.dev>
 <CAAhV-H5ELoqM8n5A-DD7LOzjb2mkRDR+pM-CAOcfGwZYcVQQ-A@mail.gmail.com>
 <99ae096a-e14f-44bc-a520-a3198e7c0671@linux.dev> <845bd2b4-a714-4ddd-8ace-a45dcdbd486c@redhat.com>
In-Reply-To: <845bd2b4-a714-4ddd-8ace-a45dcdbd486c@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 23 Apr 2025 09:01:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6RS7CZOzggJOxRg9gR8rHA=7Bd54FBapEtyap26+7rPg@mail.gmail.com>
X-Gm-Features: ATxdqUF4HVkgTC9wEST7kxdvVnHFhQ_vu_Vlbf-v4LZpKszb1HsAE8QY-5LzkG4
Message-ID: <CAAhV-H6RS7CZOzggJOxRg9gR8rHA=7Bd54FBapEtyap26+7rPg@mail.gmail.com>
Subject: Re: [PATCH net-next V2 2/3] net: stmmac: dwmac-loongson: Add new
 multi-chan IP core support
To: Paolo Abeni <pabeni@redhat.com>
Cc: Yanteng Si <si.yanteng@linux.dev>, Huacai Chen <chenhuacai@loongson.cn>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Feiyang Chen <chris.chenfeiyang@gmail.com>, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Henry Chen <chenx97@aosc.io>, Biao Dong <dongbiao@loongson.cn>, 
	Baoqi Zhang <zhangbaoqi@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 9:27=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 4/22/25 4:29 AM, Yanteng Si wrote:
> > =E5=9C=A8 4/21/25 12:20 PM, Huacai Chen =E5=86=99=E9=81=93:
> >> On Mon, Apr 21, 2025 at 10:04=E2=80=AFAM Yanteng Si <si.yanteng@linux.=
dev> wrote:
> >>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> >>>> index 2fb7a137b312..57917f26ab4d 100644
> >>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> >>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> >>>> @@ -68,10 +68,11 @@
> >>>>
> >>>>    #define PCI_DEVICE_ID_LOONGSON_GMAC 0x7a03
> >>>>    #define PCI_DEVICE_ID_LOONGSON_GNET 0x7a13
> >>>> -#define DWMAC_CORE_LS_MULTICHAN      0x10    /* Loongson custom ID =
*/
> >>>> -#define CHANNEL_NUM                  8
> >>>> +#define DWMAC_CORE_MULTICHAN_V1      0x10    /* Loongson custom ID =
0x10 */
> >>>> +#define DWMAC_CORE_MULTICHAN_V2      0x12    /* Loongson custom ID =
0x12 */
> >>>>
> >>>>    struct loongson_data {
> >>>> +     u32 multichan;
> >>> In order to make the logic clearer, I suggest splitting this patch.=
=EF=BC=9A
> >>>
> >>>
> >>> 2/4  Add multichan for loongson_data
> >>>
> >>> 3/4 Add new multi-chan IP core support
> >> I don't think the patch is unclear now, the multichan flag is really a
> >> combination of DWMAC_CORE_MULTICHAN_V1 and DWMAC_CORE_MULTICHAN_V2.
> > OK, please describe this code modification in the commit message.
>
> @Huacai, please extend the commit message, as per Yanteng's request.
Sure, will do later.

Huacai

>
> Thanks,
>
> Paolo
>
