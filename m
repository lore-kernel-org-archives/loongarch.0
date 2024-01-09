Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32473C694
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 19:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT8+7YRW"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-680d4584a81so27285606d6.1
        for <loongarch@lists.linux.dev>; Tue, 09 Jan 2024 11:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704828917; x=1705433717; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzW64ptRfrCAo122Yc/n1SHQGIxOss557ihMga016To=;
        b=nT8+7YRWzRw2T86pOWJWvn+z9Vsp9j4GrgkYW4F7ARNJaqFW5RYMzyotiS/ZdNtuoG
         p9+SkqTn33uH0iJnKtZijR6V01ysLlW0hrE9ke6kJnt0A7MIndYYirq07Rz/RkZ0pj3D
         d49+wTuJdq5xv9kmwtysfsivWbdZ4bfz2IhD9tuB+fQLFZhAzPmdicbUcCer4ojCQsQi
         m1aNns1zTQWEBnkSy3FSu/FFfGH53HeYCwvtNuKm90e2K5koj9UlxSeBEx2v3Hoc/uyX
         B51obhP8Repmv5TD3Wks9qQZLnBrhJ/d0p5b+yJU6mWKu3ZoaGEB+H2ZeTV/bjfTJ5Bq
         F/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704828917; x=1705433717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzW64ptRfrCAo122Yc/n1SHQGIxOss557ihMga016To=;
        b=NZtfiSafPi4lYfelLeD9+T2R2Ao1QXPsqcbHFfVbNKotPPsin4MK2OTl1hGNiaM0YB
         rhZ5IryopFS9lt99qpbaEEBzK2E+kRNNWriUfqHbvFX8UaoXsBEl0PSXWD851iwzFEDA
         nembER0Ykiajzn8pZv/gGRGtYW1eNzX2Azs4OxLXx+TPl6PRZtFFMSXy/k2evelbTqVo
         dTSFHGs6beC4mRn4APN+XsHhFyxWnAb0gd0+a8jQr9wMBDHcbXA+NP5bVXzxDs7S38wk
         tZ8yhfynmI5zSF35XXrcVUdsKc8qmDqM/P2D+BLzR871HYPJzQ/v/WyPbtQ0mAdH8aBP
         bPkg==
X-Gm-Message-State: AOJu0YziL6tm4+TcjUDKbzXRmM8VRxRtL5Hfh4Vg+6LUEgyf+fNu/8+4
	Z0MVedAmBLqd8jRWNRdOcnE=
X-Google-Smtp-Source: AGHT+IHT/9NQ1s8O8QwK4Ls/ZHKIo/F//1voo5RQVDE/mg/Jc8M+RXEXFTR9a3LeHTD8TBpigcXbOA==
X-Received: by 2002:ad4:5ecd:0:b0:680:d2f7:7e7 with SMTP id jm13-20020ad45ecd000000b00680d2f707e7mr1625826qvb.45.1704828917575;
        Tue, 09 Jan 2024 11:35:17 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id z8-20020a0cfec8000000b00681092cb7b4sm1117903qvs.103.2024.01.09.11.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 11:35:17 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 68CB527C005A;
	Tue,  9 Jan 2024 14:35:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 09 Jan 2024 14:35:16 -0500
X-ME-Sender: <xms:8p-dZZj3VYVagPcrppDVY1hAVttcz-brGmQ2tQRu_m8SUb9zmYPrww>
    <xme:8p-dZeAXI1oGECXctymTpshMs7pHhDKsYA3gWtzgp43dzRsVZa4P-9vQ_fyFP9j_U
    7zqc89-N3c3V3x3cg>
X-ME-Received: <xmr:8p-dZZHCRCK4tJUQ7k5byjHDt4aOdNTa5llSW3d9sLzGU7DaR4l575IIfFZplw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdehledguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeeg
    vddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:8p-dZeSJpL5T1SOUIGIK_S-Mjm8Wm0pyvMh4s0omKjUAQmaUth1fiQ>
    <xmx:8p-dZWxSZRKp-DMUofkOGNoaVZcAVoquwMebc9HEeZeJZUnHU3F4hg>
    <xmx:8p-dZU68pwGlVA9rgiJFWsZ-oU9HHuzLENgZAQ5ce128ZKBSU2tL5A>
    <xmx:9J-dZbhN9d3_srFTUJD-NfI-Yki5kCc-V2CWaC9v9ohqQXrCWG6OjA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jan 2024 14:35:13 -0500 (EST)
Date: Tue, 9 Jan 2024 11:33:51 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: WANG Rui <wangrui@loongson.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v1 0/2] Rust enablement for LoongArch
Message-ID: <ZZ2fn0scbDKBXWe5@boqun-archlinux>
References: <20240108032117.215171-1-wangrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108032117.215171-1-wangrui@loongson.cn>

Hi,

Thanks for the patch.

On Mon, Jan 08, 2024 at 11:21:15AM +0800, WANG Rui wrote:
> Enable Rust support for the LoongArch architecture.
> 

Could you share how you build and test? For example, I wonder the clang
or gcc version you used and bindgen version you used. Thanks.

Regards,
Boqun

> Previous versions:
> v0: https://lore.kernel.org/loongarch/20240106065941.180796-1-wangrui@loongson.cn/
> 
> Changes in v1:
>  - Address htmldocs warning.
> 
> WANG Rui (2):
>   Documentation: rust: Add a character to the first column
>   LoongArch: Enable initial Rust support
> 
>  Documentation/rust/arch-support.rst | 13 +++++++------
>  arch/loongarch/Kconfig              |  1 +
>  arch/loongarch/Makefile             |  3 +++
>  scripts/generate_rust_target.rs     | 10 ++++++++++
>  4 files changed, 21 insertions(+), 6 deletions(-)
> 
> -- 
> 2.43.0
> 
