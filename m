Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0998833
	for <loongarch@lists.linux.dev>; Fri, 11 Aug 2023 22:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32E2C433CA
	for <loongarch@lists.linux.dev>; Fri, 11 Aug 2023 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691791968;
	bh=ztw9IXTA9/o6jaHf5DITJvd7l5VINrbwaZzjvo3d3O0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uUPFTBB08EOS4nMKfiFUUOzChah5Dg/RYwu7Ik5rWGcDHWm/jxfltkBZis4rcmkUJ
	 3Lp+qPAdbRZbdEyja4szRTUwd+le6KB4L6gvHIM0NoRUFYFlq+dJI9Y3KpAk27Se8b
	 IDTvENSEUg9/1NNW/r0MEWv9b/M+aSD/Wzt0aeP6eJLRdZnflqAHb4ahOWvI6iVfc3
	 X+Y4GaruaHkvXAheF5TC0Gmuy2E6kQLMQprZwHnXZRirMGrqDFELxLSTRx5JmHEV1w
	 UXOKBzOQjBi2pJbJsA87zJTXgz7EigE/l2LaQ5cVHa2jnPGdlQH+jVm2ckDwqUgbiS
	 yHzoGFkDK12Ww==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bca857accbso2251439a34.0
        for <loongarch@lists.linux.dev>; Fri, 11 Aug 2023 15:12:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YydhfANU/XHI/Aaqe8EhDK5beul/SioCSp/xxUrvcezVH1KCJ7H
	OZFVvKAhrSGGn8HXhvJt0V69XAwcJtxdgOl/HRY=
X-Google-Smtp-Source: AGHT+IEfdh6kicIrknsxiZKaSFGvZfQmiVUjcpL/vCCk+9ZURRj1QpbiA7Cy9bUe7RrCZOfhVLBG72d4hMvpBQTz44w=
X-Received: by 2002:a05:6870:82a4:b0:1c0:d0e8:8ff0 with SMTP id
 q36-20020a05687082a400b001c0d0e88ff0mr3207005oae.17.1691791968250; Fri, 11
 Aug 2023 15:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <20230810141947.1236730-16-arnd@kernel.org>
In-Reply-To: <20230810141947.1236730-16-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 12 Aug 2023 07:12:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARfEmFk0Du4Hed19eX_G6tUC5wG0zP+L1AyvdpOF4ybXQ@mail.gmail.com>
Message-ID: <CAK7LNARfEmFk0Du4Hed19eX_G6tUC5wG0zP+L1AyvdpOF4ybXQ@mail.gmail.com>
Subject: Re: [PATCH 15/17] arch: fix asm-offsets.c building with -Wmissing-prototypes
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	"David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Qing Zhang <zhangqing@loongson.cn>, 
	Donglin Peng <pengdonglin@sangfor.com.cn>, Qi Hu <huqi@loongson.cn>, 
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 12, 2023 at 3:30=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When -Wmissing-prototypes is enabled, the some asm-offsets.c files fail
> to build, even when this warning is disabled in the Makefile for normal
> files:
>
> arch/sparc/kernel/asm-offsets.c:22:5: error: no previous prototype for 's=
parc32_foo' [-Werror=3Dmissing-prototypes]
> arch/sparc/kernel/asm-offsets.c:48:5: error: no previous prototype for 'f=
oo' [-Werror=3Dmissing-prototypes]
>
> Address this by making use of the same trick we have on other architectur=
es,
> renaming the unused global function to main(), which has an implicit
> prototype.


main() only works for one function call, but
there are some cases where splitting the code
into some functions makes the code cleaner.




> On loongarch, there are many functions in this file, so the trick does
> not work, adding explicit declarations works around it in a slightly
> more ugly way but is the best I could come up with here.

I do not like repeating the function names.

Could you try "static + __used" as in
arch/x86/kernel/asm-offsets.c ?





--
Best Regards
Masahiro Yamada
