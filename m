Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697DC2F59
	for <loongarch@lists.linux.dev>; Fri, 16 Sep 2022 18:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D29BC433C1
	for <loongarch@lists.linux.dev>; Fri, 16 Sep 2022 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663353453;
	bh=macHYw5z0ez1mkfuxXlyjzQ83GJ/wDauwItDipbke9c=;
	h=From:Date:Subject:To:Cc:From;
	b=Nx0CznjhziQNWjeq1FZ5ZqqOMZn/1AreraoMGX1cqKuPIsB6xRh7yut/jMNYh1rQ7
	 RtCxg7VtXnNMZR9LQoGFghPGAeG1NXzxLTyY+1zI41nwWZ+6DyLpsTNA4tt9z3T/8g
	 jIiwJYU6k3ovS0ZbC6/NAkURgTlTeDzdtBWb9gAIEDoLBFBBrDF0OTAKszMlB55RdR
	 SAhLs20pCWgXaeFu89K4uZFa3eT+ALNQAcYcMm5XFOgaS9mfucZIjBswcIPDNIcMel
	 fQ1ulqAqo8G1MY1PJlSQJprVuo/CQ74lj0CMj8QjKzZyAOv4/xTDYI9uAsjM/VmtYS
	 GWSH2NXe9Jjog==
Received: by mail-lj1-f171.google.com with SMTP id l12so26962500ljg.9
        for <loongarch@lists.linux.dev>; Fri, 16 Sep 2022 11:37:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf3bHk3fHMFG5MvItbPjCe0t+pgnNLonWHsA5F1md1Eqa7DDvCGm
	P4+bGVLa4J0OhtnOvS5YFAjtwRx9v0a42B2hbGg=
X-Google-Smtp-Source: AMsMyM73lJrGRaV9MwfEV8KiASlsJLCDMD/HmPsY2EMfjfiRHVjwb6CLeGIbhljiKNTl/TU/z6WV5VghKt+zKriE3Lg=
X-Received: by 2002:a2e:2d0a:0:b0:26c:a1c:cdf with SMTP id t10-20020a2e2d0a000000b0026c0a1c0cdfmr1989814ljt.352.1663353451049;
 Fri, 16 Sep 2022 11:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Sep 2022 20:37:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHk2o2g2t34-iMawUjfJd1uCZc1QaXH90TpS54Sg6PiCQ@mail.gmail.com>
Message-ID: <CAMj1kXHk2o2g2t34-iMawUjfJd1uCZc1QaXH90TpS54Sg6PiCQ@mail.gmail.com>
Subject: Removing DT dependency from LoongArch EFI stub
To: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>
Cc: linux-efi <linux-efi@vger.kernel.org>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

One of the things I didn't quite like was that LoongArch now uses
libfdt only because our EFI stub code depends on it. I would like to
fix this.

I have pushed a branch here that implements this. Unfortunately, it
doesn't proceed beyond

and I need some help debugging the error.

EFI stub: Booting Linux Kernel...
EFI stub: Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path
EFI stub: Exiting boot services ...

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=efi-cleanups-for-v6.1

The idea is to pass the EFI system table pointer and the command line
pointer directly. In previous patches, the initrd and memmap code is
updated so it exposes the information via configuration tables that
the generic code can parse.

Any help is greatly appreciated.

Thanks,
Ard.
