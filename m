Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8279817BA6
	for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6RubjWU"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbd029beef4so7675226276.0
        for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 08:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705334903; x=1705939703; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3v5EekwNwbyCQhxBwrr1k0zzHga5tdMVcMO2ueic0Y=;
        b=B6RubjWUeMvkM5S3bO3Anl7bFX7MinYaVpWFV8dmfH+1oyQugIdrHyr1dHo+1y1rl4
         sc1u2LBkix2E6k3bbxYo6WFs+PnxsvmaAVoZI7wNdlq8nJjXVHy4i48HKvGi3Zh0+cQW
         I9KeWojoF9vUynvuz1gS1p3EYnSmM9yzoZVKNGBq5otpM5+dy70jqU029usyNsAZHlFu
         OZWo4zjkDUgng5a/oCHqSgOJhEwip58WVKlWkpTv1mZfjQNYkMzvuNWnmdKMUmQhb2mL
         bvItHqDiaRq6Ka72ovf6rpMbxPmuy/iQwc4mKGR5BSxIu46CzrEBc6FO2wLwH312kVPI
         LNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334903; x=1705939703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3v5EekwNwbyCQhxBwrr1k0zzHga5tdMVcMO2ueic0Y=;
        b=PCzo7u0paHO0AQSusoMkgbanDyoDyiEf9LAjQoJLmyn/vGp/k3DvYR69xmR9oaRImp
         k/mC1/dtL2GU1fSPAvP0aSiSNcqkVFU7nJIQsEoOfn8PkSTm/CCtNaR4ZB0LduQvfOkr
         ItiGFVdOgDgvRJM3t6JmGzCLzSCzST04c1yfKo5IflyLiIa7yN601mAXWqnfKuAPETPF
         E7K3lguvksYIzcl97gvSwnv9kjNC7iCKiUHxayWiaLBAse2feLNBn0mLKMwFYysH6x88
         jEh5DKNTdqMfJrZzV7LBLwudU4pXJ20Zow9TJlEvJ+bxoHKOROA6W0yfmD1kjfEggdzc
         Xi7A==
X-Gm-Message-State: AOJu0Yx+3pOpV75dbPUiuROAFnd20j4DrA8jgRuWiUv3VzncNPF0+JqC
	im83bJhn6sGFWPpI2DCLtUv6SRtATfJixPqBTxk=
X-Google-Smtp-Source: AGHT+IF5lVpaG5zhAB2+/ap5mK0eaqQRLUd+krj5DSXQ0aQKe1cRVSF2/UbAjhQs8dzHm5uDLMc+f90KsJb3hDLIbKg=
X-Received: by 2002:a05:6902:2185:b0:dbe:3a98:5977 with SMTP id
 dl5-20020a056902218500b00dbe3a985977mr3216881ybb.62.1705334903452; Mon, 15
 Jan 2024 08:08:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240108032117.215171-1-wangrui@loongson.cn> <ZZ2fn0scbDKBXWe5@boqun-archlinux>
 <CAHirt9iox8FGV2wrMyxwFRjab2avfOcyLKvBc9K=AqiHxqHXKg@mail.gmail.com>
 <ZZ38XMQw18mw2sTA@Boquns-Mac-mini.home> <CAHirt9jQSVvBF=1wc=sT9FxngeSP30P4FDpu8m0JH_0fOPSO-w@mail.gmail.com>
 <CANiq72=X3cggAn0HLMi7jVFAfypBhog=ZkPB57yfaX4ZUzT-HA@mail.gmail.com>
 <CAHirt9hdtGSsEofxDb0FCtcFeAw9n9LKJALz23Qdqh4n2=Ua5A@mail.gmail.com>
 <CANiq72n7K8LcKrs+beF2sbt1XLdr4zEhEw4xcy3yh4wgTrvYeg@mail.gmail.com> <CAAhV-H72Hbfy7n6+AFSFFOzizo0GtpzA074sgo48-W-Dt0VR+w@mail.gmail.com>
In-Reply-To: <CAAhV-H72Hbfy7n6+AFSFFOzizo0GtpzA074sgo48-W-Dt0VR+w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Jan 2024 17:08:11 +0100
Message-ID: <CANiq72mEPnB7yEZvtUXAM5w0GgYmzdrM9OhioLGb_LzbAJKNOA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Rust enablement for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 4:23=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Thank you for your suggestion, but since this will be replaced by the
> built-in target soon, and I don't want to change the tag to make Linus
> unhappy. Let's leave it as is.

The issue is not a big deal and I appreciate that you made the effort
to enable Rust for your architecture. However, please note that we do
our best to maintain a clean formatting state for Rust code (i.e.
`rustfmt` should be run) and that people may see this in tests/CIs
that use the Make target.

I don't think Linus would mind too much, and you could point him to
this email if you want (or you could put the fix on top); but if you
really want to keep the tag as-is, then we should consider it as a fix
for this cycle, i.e. we should not wait for e.g. the next cycle for
the built-in target. Could you please send it through your tree as
soon as possible?

Cheers,
Miguel
