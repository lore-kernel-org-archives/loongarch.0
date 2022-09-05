Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44FD28EA
	for <loongarch@lists.linux.dev>; Mon,  5 Sep 2022 07:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F113C43142
	for <loongarch@lists.linux.dev>; Mon,  5 Sep 2022 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662361483;
	bh=gABsR+C8s1QYA2kJuQbKyt5Do4plDC0D2eCx6RfARLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MzycPAexg5XdWGeU4fi08dtp7cGApj/o0eq9owOGhMOpvI62AapOnSKjpezLtg2Dl
	 gI0Dp3XClL9p7Vsl9RlrwuWUWkXbJBugctHn70cSCdjTDEtt7+dApTcp30SjVXqxvZ
	 bliZ0X+EcWyu0VzziBe0Y4UqRZRhu2yNf2t+xJh50cL6+ScSdZ2T6xPtA2eEbg0BG9
	 e1OS/tqFyzVfkaHKFdL5jTUOGiib16nYMPQvgUINsRoFyeVefKC8V2H1RZHmksa5T+
	 O438BBZW6nCe+xiqVBvZnP6ANizU6SGUWEGdsOBXLXokUc6jDXmSqscp3xBDgQCxIM
	 yewJbrUU5jLcQ==
Received: by mail-lf1-f54.google.com with SMTP id bt10so11843281lfb.1
        for <loongarch@lists.linux.dev>; Mon, 05 Sep 2022 00:04:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo1PU6lBYIgqEJA9O60QrT64IJ6B2sAe9k8QSb/8B/zYLzRIis7N
	70vEa4XnRcHypQf+pDcCcq9cr9EG0XKMgxObrGA=
X-Google-Smtp-Source: AA6agR5beeTW6f/IM3Hyd4GU9/H9AoDWKkjjc75oL9DUZe8qduXi1GWu10PbgZ8g5dtSppNKZvYN2MvsDb5xt0foixA=
X-Received: by 2002:a05:6512:150e:b0:492:d9fd:9bdf with SMTP id
 bq14-20020a056512150e00b00492d9fd9bdfmr15272229lfb.583.1662361481624; Mon, 05
 Sep 2022 00:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819102037.2697798-1-chenhuacai@loongson.cn>
 <9b6f0aeaebbd36882b5b40d655f9ccd20c7be496.camel@xry111.site>
 <CAMj1kXFOd+gMHbi6MH0KHWkBEKN9V0LeZbyGRw8h630OxtMrdA@mail.gmail.com>
 <CAAhV-H6MR=rWhecY_uuiXAysED-BBJhKhGHj2cCkefJiPOo-ZQ@mail.gmail.com>
 <CAAhV-H4KXVUBgNoQxOFiEj2AH-ojhnrEJ8QLvNrALY69MhXF3w@mail.gmail.com>
 <CAMj1kXHJv_6mLhMikg+ic7=EUABLdrX3f__eBbHntrpGHjRfXg@mail.gmail.com>
 <CAAhV-H4WTCRU9qShDp57AZ2DG1uz+=GTz14zyAUaqVDjXrNABA@mail.gmail.com>
 <8319b9d4-960c-e706-468a-cb58bef6df8c@loongson.cn> <2772310e-a537-a733-c7c1-be3ff243d2fe@loongson.cn>
In-Reply-To: <2772310e-a537-a733-c7c1-be3ff243d2fe@loongson.cn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 5 Sep 2022 09:04:30 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEj_4amyccrHu40i6XTrSX9bxZdXL=8aY=AD9QT-2JmDw@mail.gmail.com>
Message-ID: <CAMj1kXEj_4amyccrHu40i6XTrSX9bxZdXL=8aY=AD9QT-2JmDw@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Youling Tang <tangyouling@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>, 
	Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi <linux-efi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Sept 2022 at 08:29, Youling Tang <tangyouling@loongson.cn> wrote:
>
> Hi, Ard & Huacai
>
> While applying this patch [1] we need to add vmlinuz* (vmlinuz and
> vmlinuz.efi) to arch/loongarch/boot/.gitignore to ignore the generated
> binary (also required for arm64 and riscv).
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=efi-decompressor-v4&id=efcc03a013f2ddbed0ee782e5049b39432dc9db2
>

Good point. I'll add that.
