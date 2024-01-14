Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD47E
	for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSThnFbl"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dde5d308c6so2914035a34.0
        for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 07:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705247037; x=1705851837; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6fsnynes0vO+z8SDnt6jjjUyKp+VvnkB7fpxe78CwY=;
        b=JSThnFblAZEXJOEwM1vlGxC8OVRaAOCu0sTO189RAlkiREfaTRNFsDZExbQUZcss/W
         z6r86oLs6gMfTJnomRfepfSoSTM0n4zbNe1S0wz2FSkreZCJXINZ27uPFrZPXKQR32z9
         lefKJi+7JaBOPxKCF6XOONLOMbZnVauao8gJ2meZse0EZSmH84cfsJb2Gb6hfh7vmSsk
         Sm8w2EZ7kY25GH8KDMqOpmOnpiaM79WzNydftt6zdheT83q1QXWkd0B5g+KYsh4dlPf2
         YQm84U1rtUENa5Uy7xlt60bFSe1uNn6+vMpZtAX7fx6cn5OEltPoGSB9OfIBrC0VDvUq
         ZxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705247037; x=1705851837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6fsnynes0vO+z8SDnt6jjjUyKp+VvnkB7fpxe78CwY=;
        b=LNj+ZiwRWjncDRQAALDc2cM0Oy9RhzRw7rDpwBPI7a+1CkcA2zY0E8yde5vX5yxZf9
         8OYyHDAkioqCGxm2/JI+s2amlOp6I4JSX9ifFFMikInVWkU+6b/vPh6srOd7jM88/dFk
         jB5Q64zTMiZJuX59R/+bDPJCwDFd+kCLkciCKpuuAWwDpMNQoz4EeJZfZKDfQCYw9FDH
         EzKsh8ym/RhvlHlAb2Lo9HTZCU9UbpzspKcAcB/mS1Qj6Ui1qMWJ5bHVj4W6CW2ZJoGI
         WRVuAGATd1KhKhxqs6xJEXnYUJif2zuw+dpRIocaI0cAZU8tDH19IsXyGAakiEDIOEiK
         3NVw==
X-Gm-Message-State: AOJu0YyULDJ7/mZE3rRy6irmfcuMcbbM6HbrV6zVcP45U4l9DTVBFo7m
	Xs5Z4CYyHSqRkF9WUHZNr8GIDi7XW4YZMicmSis=
X-Google-Smtp-Source: AGHT+IEBUS1Lk9KquvNh+AEEgwGYDkKmF9ia0vinlcAsqnTVB/V+nqiprHElf2rORE5ktsStx+qC6yV6xTNuDc/rWoc=
X-Received: by 2002:a05:6359:2ea2:b0:175:ca98:881b with SMTP id
 rp34-20020a0563592ea200b00175ca98881bmr2063172rwb.34.1705247037364; Sun, 14
 Jan 2024 07:43:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240108032117.215171-1-wangrui@loongson.cn> <ZZ2fn0scbDKBXWe5@boqun-archlinux>
 <CAHirt9iox8FGV2wrMyxwFRjab2avfOcyLKvBc9K=AqiHxqHXKg@mail.gmail.com>
 <ZZ38XMQw18mw2sTA@Boquns-Mac-mini.home> <CAHirt9jQSVvBF=1wc=sT9FxngeSP30P4FDpu8m0JH_0fOPSO-w@mail.gmail.com>
 <CANiq72=X3cggAn0HLMi7jVFAfypBhog=ZkPB57yfaX4ZUzT-HA@mail.gmail.com> <CAHirt9hdtGSsEofxDb0FCtcFeAw9n9LKJALz23Qdqh4n2=Ua5A@mail.gmail.com>
In-Reply-To: <CAHirt9hdtGSsEofxDb0FCtcFeAw9n9LKJALz23Qdqh4n2=Ua5A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 14 Jan 2024 16:43:46 +0100
Message-ID: <CANiq72n7K8LcKrs+beF2sbt1XLdr4zEhEw4xcy3yh4wgTrvYeg@mail.gmail.com>
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

On Thu, Jan 11, 2024 at 4:16=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> 6.8

Thanks, that is quite expedited...

Please `rustfmt` the code to avoid failing the `rustfmtcheck` target.
I see you already created the 6.8 tag but I have not seen it in
linux-next yet and you did not send the PR, so it would be ideal if
you could fix this before it goes to Linus.

diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target=
.rs
index 3edda6a10..0da52b548 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -163,10 +163,7 @@ fn main() {
         ts.push("target-pointer-width", "64");
     } else if cfg.has("LOONGARCH") {
         ts.push("arch", "loongarch64");
-        ts.push(
-            "data-layout",
-            "e-m:e-p:64:64-i64:64-i128:128-n64-S128",
-        );
+        ts.push("data-layout", "e-m:e-p:64:64-i64:64-i128:128-n64-S128");
         ts.push("features", "-f,-d");
         ts.push("llvm-target", "loongarch64-linux-gnusf");
         ts.push("llvm-abiname", "lp64s");

Thanks!

Cheers,
Miguel
