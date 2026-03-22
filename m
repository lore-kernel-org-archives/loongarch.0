Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F1432AABC
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774185349; cv=none; b=hFjyEWWv3rlp91XaWxzCjIda9FAtQGn7KIBU5ELYR3XbQIVOTlY/SfTmiv7zSC1N+6fmsed2rlFAQ3RUuUjbR6HYWD++eQ3D8FSeehsN0ZbB+8L3Nt4HFCTdTV2F5a/B+0yDfoDo3Hm3nsSgNvo6nj+2FaAZsL8JcwUPDXqz1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774185349; c=relaxed/simple;
	bh=XgIurM27+yuPnraUNcace74O0DzcA/FNq83Lf7ACMtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C65enw3WJg5BfmC9RhrcsPBsesdJjYvjbZXk1y/Ys0HR2ss4FS8hhHx1Bq6Np62Y3GgVVKUqgcMm88mq2G1VBJWohml55AWCxH6DeeL0xhkPLVNmKGFcVGnFVvqQ6g7En9NUuyckDfCTV6chFo+Iqr2cTq0Uak+k5qVZkVBP4U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABj+hewg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABj+hewg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613EFC2BCB4
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774185349;
	bh=XgIurM27+yuPnraUNcace74O0DzcA/FNq83Lf7ACMtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ABj+hewgDocJHq2qPbVtB5Hf0qCPM8h/2O6Fx7HMdCwkKp/kEbM7Mak96E3KxzQfg
	 sx2lXqdnkWQo0Rpy4SX3PHDkd0Wt4EYXytGHm71xEtlFJ/HPCXUAn4QDOSvFh3pHFt
	 z0gr/kBsQIpPP8gIK2wdvJxCX0mpmIMgfQT7GM+T0gLt2eVabIEw18iMhQcjwMPsDQ
	 fb0yLsVNcj64a7cpz7Tl/A6XZ4F49YVzmPYmtlJyizDusNS5/fzliC4M/pf+1j0aHT
	 Kl4ED8TP5ec+WOsLSk2MOA2z0hUd8TGULmYWF8vCskFUa5kJHF09yxTbgoNlgadSrj
	 wu4BbfLD/jSmA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b886fc047d5so560693366b.3
        for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 06:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJj9EnbbT+Dhcp7PsL6nr4czucgK0N6SFcktyrtCjbDPaJznPGmNZfpujU/B025wRCBKHTv+NHFTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCSkV0DdkItlsj1vheJRBMB89zEOLJQSo6qQLdwCNNNmfDVCvW
	R/lEjMPyB2fmOKYja6gBIkjdCyerKHnE8GOiZsbME6ZADanxoCbqJdjw6JyaGjxEHe3+PRAawWi
	KwGflzlTbCI8jj6ArtbEvh/maGAem9H8=
X-Received: by 2002:a17:906:eb46:b0:b93:89cd:2bbc with SMTP id
 a640c23a62f3a-b982f50de73mr503440366b.56.1774185347917; Sun, 22 Mar 2026
 06:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com> <ab_iF2hjZRfp16HP@pie>
In-Reply-To: <ab_iF2hjZRfp16HP@pie>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 22 Mar 2026 21:15:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
X-Gm-Features: AaiRm50PppF1EV4HWBhOscL6VJ6mdhxpTPfiBfUVbEHaqZXVEmFXdeP5eO9o5j0
Message-ID: <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add Loongson-2K0300 processor support
To: Yao Zi <me@ziyao.cc>
Cc: wjjsn <wjjsn@qq.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kernel@xen0n.name, devicetree@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wjjsn <2858482031@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 8:36=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> On Sun, Mar 22, 2026 at 03:13:14PM +0800, wjjsn wrote:
> > From: wjjsn <2858482031@qq.com>
> >
> > The first patch adds the necessary DT binding documentation,
> > and the second patch adds the DTS and DTSI files for the SoC
> > and the board.
>
> Please note I'm working on basic drivers/devicetree for 2K0300
> platform[1][2][3], though the series haven't been updated for some
> time... I've re-written the pinctrl part, and will try to re-spin all of
> them next weekend.
>
> Also, previously Huacai expressed preference on delaying devicetree
> changes until basic drivers are ready[4], so anyway we should probably
> get driver patches merged first.
Yes, I confirm that.

Huacai

>
> Regards,
> Yao Zi
>
> [1]: https://lore.kernel.org/all/20250523095408.25919-4-ziyao@disroot.org=
/
> [2]: https://lore.kernel.org/all/20250811163749.47028-2-ziyao@disroot.org=
/
> [3]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org=
/
> [4]: https://lore.kernel.org/all/CAAhV-H6EDEf3U6w5KY3R3HCAdAbqDefqpE3ktCQ=
eQtFbDK2Ypg@mail.gmail.com/
>
