Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210747A57
	for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmOnLmyB"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f0629e67f4so40994837b3.3
        for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 02:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704883780; x=1705488580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkyAuv09jckrb1xtJ7Sn9m5uY5gMhi9Dyi8024qOado=;
        b=BmOnLmyB+CYwka1ovy3dBHKTeCcM4gsbWsU8ob4k7zh6PJvxQov8/Y0lEqaJX1iFon
         ZqpuXbkfomOz88YQ+DG6NF+kckMmQC4Epgftem6uH1Zzef5r9nKLtId/9wdKqk3qfKdp
         r/4dGew4d8UsUlTZaQYAYNtuL1wsuy1s56cahoA+LawNR7tGbq+Z2rTwGVOHxepTPM8w
         7cxxybG2Rd5GtNc6iMoPDVh3tnPcF0plzfgJ+4HTVThKctk2aZiXCMrXCcGqpWspRcC8
         KlJExVcNfGJHFEuT2oNcf2E4nVx6T68U783lh+FRPJ/uah6BZCsCsLg858IqvR4jaxM7
         hs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704883780; x=1705488580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkyAuv09jckrb1xtJ7Sn9m5uY5gMhi9Dyi8024qOado=;
        b=F2scBK8R8hMFlvgd7CPu9CsyWA/kcA5LKyIcUhECCA5que53QKIUjMqHo5tj7A7txq
         gtpKi0GIvycoVO5oWOjAgCJYLX5kvb7+iuTOc9Hl0JxsNx71WETbKTm654wUIqIHjkZi
         St90uD5eoIZ59aemOb0gUdXpVQIiBcCnYo8YffS2EO1mOuyBfUdR1e8g2P0q2GtoK4Y2
         ksHNCGgvzoKYS3JR8BcN+unMDGG0j1P+e/c2WiExXc+DbK2i4yq4Gxx87XfJ3HgjJ3ug
         r+OmqhrYxFB5T4w3QxDqvEy8SrXwM25Nnws5jfeGPIzwAxelinTh7dv5JJU9iM7P05ul
         mdjQ==
X-Gm-Message-State: AOJu0YzjKRouZwfweD85Fbdvzb43LzVnltLCMjfvEHHOaeMJieszKnFV
	h2DzNXapRuhtBw+8nciKcwO8RqkwfToBA2t8Id8=
X-Google-Smtp-Source: AGHT+IFeCydfST7aDCwuFPDsuw2cwzVOE8Fv3I4KKk4ctjbM0/io4Cl/D+NT6BNGEexZTsX+/kt1LFfmucwY15LWnKw=
X-Received: by 2002:a81:6d0f:0:b0:5e8:8053:70d1 with SMTP id
 i15-20020a816d0f000000b005e8805370d1mr793142ywc.50.1704883780409; Wed, 10 Jan
 2024 02:49:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240108032117.215171-1-wangrui@loongson.cn> <ZZ2fn0scbDKBXWe5@boqun-archlinux>
 <CAHirt9iox8FGV2wrMyxwFRjab2avfOcyLKvBc9K=AqiHxqHXKg@mail.gmail.com>
 <ZZ38XMQw18mw2sTA@Boquns-Mac-mini.home> <CAHirt9jQSVvBF=1wc=sT9FxngeSP30P4FDpu8m0JH_0fOPSO-w@mail.gmail.com>
In-Reply-To: <CAHirt9jQSVvBF=1wc=sT9FxngeSP30P4FDpu8m0JH_0fOPSO-w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jan 2024 11:49:29 +0100
Message-ID: <CANiq72=X3cggAn0HLMi7jVFAfypBhog=ZkPB57yfaX4ZUzT-HA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Rust enablement for LoongArch
To: WANG Rui <wangrui@loongson.cn>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 3:49=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> LLVM 17 doesn't work. The minimum LLVM version required for LoongArch
> is 18.0.0. This is the reason why we have updated the
> scripts/min-tool-version.sh. [1]
>
> [1] https://lore.kernel.org/loongarch/20240108033138.217032-1-wangrui@loo=
ngson.cn/

Thanks! Is this targeted at 6.9?

Cheers,
Miguel
