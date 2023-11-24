Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6953B2
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 06:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EI7OrgY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73742C433C7
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 06:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700807400;
	bh=oiNCRYAubqwmfHqn3Lz8yuE4Y1PgrSngGNRb2Gl0x24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EI7OrgY715vyUEJcygWPEJMHLn9DBDRRMK7h08f/AxlyAcFndfjsl19K9H9ZCir4k
	 hAtXedSWyxZmv4nsJCM8BWSq27bO2dup3PmJccfwNL5wRFBL+I4ZDJWEDy61S4nwWh
	 Mj2begbuQ3NalJeT9Bw7vnPbxhM/65JKY1k9wVtP03pvd4ucXfj0nQqYjKZiQq2/Z8
	 H5iffEusxoyfO4Fc4iDzB7tHo/bRhx9anQ0dbzlNlaWkRlNanTT9wUIu1HPN6GNhAc
	 5lq+o768Pk7lRNGXqvkkbkZPaEiWhMSxwh5GZgI8xexoFcrro14v81hIA8lRa/69Oh
	 c/XEvoGC3T5rA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a00191363c1so223773366b.0
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 22:30:00 -0800 (PST)
X-Gm-Message-State: AOJu0YxCoIwCikdLKfNdDkspVFqXKdOMyI/YOk8yTQBJShlmw7bRUlQu
	qVM1dJU6Frfd3eNcjp9cANT3XgqoHu/uZ6vRCJE=
X-Google-Smtp-Source: AGHT+IGsymUJr2QoVMlOTN0U+d9T0/ykrdcIG792MmcCttCZX++e67xjsoJCMInSt59oWpXp/l2jTBuPs54kRPdvUf8=
X-Received: by 2002:a17:906:2d51:b0:a02:2c70:b620 with SMTP id
 e17-20020a1709062d5100b00a022c70b620mr882376eji.53.1700807398875; Thu, 23 Nov
 2023 22:29:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com>
In-Reply-To: <CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Nov 2023 14:29:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5pKEzVnHKCiHm9=9wDapa5RhS5uMFEo2KHBskYrP7DnQ@mail.gmail.com>
Message-ID: <CAAhV-H5pKEzVnHKCiHm9=9wDapa5RhS5uMFEo2KHBskYrP7DnQ@mail.gmail.com>
Subject: Re: Kernel panic and stall triggered by bpf selftests
To: Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add Tiezhu since he is familiar with bpf.

Huacai

On Thu, Nov 23, 2023 at 11:12=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
>
> Hello,
>
> The following bpf selftests tigger kernel panics and stalls (RCU related)
>
> | TEST CASE               | JIT    | JIT + UNPRIV |
> | cls_redirect            | PANIC  | PANIC        |
> | sockopt_inherit         | STALL  | STALL        |
> | test_profiler           | N/A    | STALL        |
> | verifier_map_ptr_mixing | PANIC  | PANIC        |
> | verifier_movsx          | PASSED | STALL        |
>
> BPF JIT can be enabled by:
>   # echo 1 > /proc/sys/net/core/bpf_jit_enable
> unprivileged BPF can be enabled by:
>   # echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled
>
> For the full logs of each test cases, see below
> https://github.com/chenhengqi/public/commit/75a265e961e5d93b61c3b012e16f1=
db2f9d333b5
>
> I spent quite some time debugging this, but unable to isolate the
> related code path.
>
> Thoughts welcome.
>
> --
> Hengqi
