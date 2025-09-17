Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E893002A5
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758132050; cv=none; b=C9kvUM3o6XKnnyfVuj7T3VDT3e7yzDU6PRoNa5gZuN4uuuox4VjmFzJjroKQ/s/vyTL5/x/3yPhXAGiFot38+ZDi7rATUOnTI/jW+T3hMRuCHmka8XuX0iLJxDs283fSuUzXm5b8HuQ7jjcV+U/X+QWfit4xfhyMQxILeZHSQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758132050; c=relaxed/simple;
	bh=DLDcGQ3mu3T/MPVKq0NF9V2I5Jn6ILZwFaw9KVQfhOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTrns/vW6rBkeC7UUxgLOUEsYrlGZbaVJLNJ4mSY++Zzrp1lBJIfyHbEjvP1oSY2OdQK12HdSAcC8hVegJkC7nm/tXdL9v2zXzlt03RRFVm/2m0Ph/IQ3Up1Ol8RiiyZed7xyYgb/5cyPAs9YwVC8OLhHUh8AP/gUNaOQYM/KK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=0/5NAZ4c; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="0/5NAZ4c"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f76454f69so135560e87.0
        for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1758132044; x=1758736844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=0/5NAZ4cvChlm+4GCcsKjNL6HMLwPRQF1ViPksDED5eDzxMu9ZxsLsGHrxYjS5WDSj
         j2MQtEHjdK9qp0YtXtK/TdNJ0DHIB0P2tyH/FGjsQhF4vaa7kd7fgI3XdiZDSNallvDN
         8pvqib4GZiVxlSVlX7p3pWh89l1r9siSbpgenEStMyGDfMrAGafYNf/0zxSuTeLfRFDO
         4E7j8qd8M6IJ7oK6nL2x1VXjxvYp7n+21IaznyVsNV/Goy841DI3bZKtB6fc8nfiQZDd
         Rv1d8rWO4ucz/EurgLOnxdoTKe7w3ZAEqmy9PIo26TevFSZ06KGBh5cTIZFIxetsBhcO
         6LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758132044; x=1758736844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=VJbBE+HJIIIGrXbzrP8mMiCN7YdEs0UloRo4DX3RSCOYb+nzBKCCwuYO25uwFW3F1A
         /6r7w9N9/4F7ShL8LmBZrjxvFPcF0saKWAe4kMhmd/Lq4BP/ZFRhysgQWsgXTDk+w/V0
         8F9YnySSieQj5RKTMlUdsLOdFArkS2CNbYiuaCdd9Ml/P/jMkA2DCkehUaLuEjH0xEE1
         RXAYYP5biLUQNh+2XR1DrXDnZX07CNql+ATyhMcsObsjZ4XwqYe+LV22UewkW9cQejYD
         e5lGZLo7QIuQudcrDT6+hGL1lnhng517kfj11SXUT8k4irsHk9hIFMK5Du4uJY1uIWCn
         8Ntg==
X-Forwarded-Encrypted: i=1; AJvYcCXiH0yOIg4ryy9+Lnd766kVpz7IVzfhUDfMv373HwkXiJLjUOXzxoBOwvIIBT4IUy3KRaHWLRet6MY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkaITRwXV49HQR9u3eauwEayNT8WpYgJwzGe9Y/Mk9ndklHV9p
	oTKIQ9fdk7wEGxjsjinT6BVghVGmvkR284+KYKoM1hJjZwKl4rYdHk2aGABSbppCPUudtC/vv2K
	niMelR7AS+OB9YSJZwQXNHx6jqO23b4Bbu/DMxirz
X-Gm-Gg: ASbGnct0sP8pJeP8I+F3vEbKU2eEEDaJDFsqDAf5GuxlGXzngZjj5oRQ9CeEFmtZ5II
	lGTXe2sZ9kfwSXX5MULAT2MIoWEJIlpp1YLAxHZB3SieAUCjx3NBckf/Ti8ZBd5PKGx6xF6WKcG
	K8BpoK3VXYo6v4OLZpVub6XNW01WDE+yfnxNXhKWKkyjqBpPwtW1KVX9cnZJ8GKu7y6fE4FWwB3
	gTBXg==
X-Google-Smtp-Source: AGHT+IGI+xF2OSgRbI6+fabXiqu9Xwuf5bxWYwnja/rNGOUuSmNzhH42MNUAKuR34Ox7ov8nmiujA9clDhMS84oRbmU=
X-Received: by 2002:ac2:4e09:0:b0:576:d217:3f2f with SMTP id
 2adb3069b0e04-57796b5e819mr1028160e87.3.1758132043747; Wed, 17 Sep 2025
 11:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912223937.3735076-1-safinaskar@zohomail.com> <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
In-Reply-To: <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 17 Sep 2025 11:00:32 -0700
X-Gm-Features: AS18NWAGwakGZ9zjxjq7MnfN8O7ZgOJb6fmKIJ0JIML7P3j0NnlDZ27eNb5S7Es
Message-ID: <CALCETrXHxOkHoS+0zhvc4cfpZqJ0wpfQUDnXW-A-qyQkqur-DQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] initrd: remove classic initrd support
To: Rob Landley <rob@landley.net>
Cc: Askar Safin <safinaskar@zohomail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 10:09=E2=80=AFAM Rob Landley <rob@landley.net> wrot=
e:

> While you're at it, could you fix static/builtin initramfs so PID 1 has
> a valid stdin/stdout/stderr?
>
> A static initramfs won't create /dev/console if the embedded initramfs
> image doesn't contain it, which a non-root build can't mknod, so the
> kernel plumbing won't see it dev in the directory we point it at unless
> we build with root access.

I have no current insight as to whether there's a kernel issue here,
but why are you trying to put actual device nodes in an actual
filesystem as part of a build process?  It's extremely straightforward
to emit devices nodes in cpio format, and IMO it's far *more*
straightforward to do that than to make a whole directory, try to get
all the modes right, and cpio it up.

I wrote an absolutely trivial tool for this several years ago:

https://github.com/amluto/virtme/blob/master/virtme/cpiowriter.py

it would be barely more complicated to strip the trailer off an cpio
file from some other source, add some device nodes, and stick the
trailer back on.  But it's also really, really, really easy to emit an
entire, functioning cpio-formatted initramfs from plain user code with
no filesystem manipulation at all.  This also makes that portion of
the build reproducible, which is worth quite a bit IMO.

--Andy
