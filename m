Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C020FE
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 16:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04F3C433C7
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691425162;
	bh=RCjQ6vti5d4rtFH23MxMIY1p9y9CRqE3VIV6VqW/Gnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hd6un6urbdSo8Id+eeRkX5erMb52evs3hyzmavrkSLipkH5JoeSegYAEleIKPgW8m
	 eCqpQ8tyFKTDbrkIQOjcWFCbDCEadL5BE90GhYhrWrKy8DyiNtUDpVCb9wKrAIN0n5
	 GR3e9SYrnuWs5166VSW3z07LbOZpKHk0AQIQaCtKp0/UYVSLdJYe2zZvVRnsMihyBu
	 ADfcyrjrnmObHekPQk6C50rl3YxKen9FjqX8MJzqWVLxZT1XGFINUlKXJpDWYtN/rn
	 tddHOn4K4Y2Gzh6HOUU0dLMeFYkFyOqXuQ/o21jOnQ01Es7EisJUW8QrEh1CO2SWZq
	 84VHtIHuToTcQ==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b9e478e122so3910931a34.1
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 09:19:21 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx1+w6a5Q+pd32ss0RePDS7Z2IKyFDSDu0hXG/sSIBBK/U5Tx7z
	jQvv4h1ZzVAjmtix1XwJ9AwcrYoVT+/Y2K97Dkc=
X-Google-Smtp-Source: AGHT+IFvChfuLszjtoRr3uXfgd3k35TSz6VMm1GNzaFKTSum1bvO419fx3Nk4Q1aAYASirJws2c6fASuYHU6yNRU7cI=
X-Received: by 2002:a05:6870:96aa:b0:1be:ccce:7993 with SMTP id
 o42-20020a05687096aa00b001beccce7993mr11267917oaq.40.1691425161242; Mon, 07
 Aug 2023 09:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807154250.998765-1-masahiroy@kernel.org> <20230807154250.998765-3-masahiroy@kernel.org>
 <CAAhV-H7VzqPBYD0o1qAY7v7z+G9xOMq+yOR9ZTcO1SKfCXVZ0g@mail.gmail.com>
In-Reply-To: <CAAhV-H7VzqPBYD0o1qAY7v7z+G9xOMq+yOR9ZTcO1SKfCXVZ0g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 8 Aug 2023 01:18:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnGTZEBokjcqzVyRugn0zQfodED8Jhq8AQdz5qXJMr0w@mail.gmail.com>
Message-ID: <CAK7LNATnGTZEBokjcqzVyRugn0zQfodED8Jhq8AQdz5qXJMr0w@mail.gmail.com>
Subject: Re: [PATCH 3/3] loongarch: remove <asm/export.h>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 12:56=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Masahiro,
>
> Is this series only for linux-next (6.6), or also needed by 6.5?

I meant it for  linux-next (6.6).

Code clean-up can wait for the next MW.



--=20
Best Regards
Masahiro Yamada
