Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F016A23
	for <loongarch@lists.linux.dev>; Sun, 22 Sep 2024 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727010722; cv=none; b=NPmDwK0rtIH71XZE7js2dwLFXy8WvPgyvmK3qzoe0Hl5dvJ04QLrICQYSQxzFYQFGdRI1F92L3Z6nf2yfnpKZ+p0rr5Utr9qDp58facgVtcNZljX2zMpS21du0ymvQ98p988CDIWGUbmd2zflyyYfT1w4JxVe2nrb+gllpYlK9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727010722; c=relaxed/simple;
	bh=K69oMExutIbqq5vLU3cF9g+1TZsKEYU7QDt+mrwggMU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uM+31BW1DXrLWeagRNvqd5Y3OC2NX29poT2mBanr9smvz2hxnwTMcdUT6cowZYvu8baIO3HMZRYQnjRGQtENaNC/N73OrH+za69ZNxFryfcYxqg7WWGkSUnH7xsYeAH8slVNKa3En3JSeaz7hdbsfOsgVTTJBxIbmcXoh9s+tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY8uB7qy; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY8uB7qy"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2da516e6940so673646a91.3
        for <loongarch@lists.linux.dev>; Sun, 22 Sep 2024 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727010720; x=1727615520; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K4l4J7IsYFxdmsYbyBoKStS5kUAi9gU5DhoPh14DwxE=;
        b=MY8uB7qyRKNGZgMzIS6FZ3+UHJvsmBbBCXzYnJIwIaQZ2Uyv555OLUcUdCwXDynRFM
         gTgX7GwfvNAHhyAhYItBA3hbJLqbkNcyJRBodqdX6XGdLiHl8PoLtX1qYA2zjqqa9Odt
         IcXRQfU6hauEi6GB7ikhvcfVbITMeBn5uKEzgGUNg9Wk5Bw2FJLaorVil0KUwt/H3ODi
         YWF9kw8L5itfX+bgITJpsW8iNxLxAwlSXY5EJ/iEuiubN9NmDtOzR0g7Sm/ANh6+SUXX
         QkAc71ztxfC5754GjvN3IWGXTqyhbZ3+BRg/bozC0XlqI/7BS/NQN5ySVz+B+Zc+T4Nx
         csPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727010720; x=1727615520;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4l4J7IsYFxdmsYbyBoKStS5kUAi9gU5DhoPh14DwxE=;
        b=k0cAgpBFSV4+KzLL91FLMTnzkW5b1yDgmf7A6iq0Ntx2gyWSmWReXP4txXVdVcXFBH
         G8lC08bLvtI5xjV86GZIh/meOfItOB9EQzoIpWqoGOJ+CGiknGnY3lp4WYzSEvQjrOWG
         Eq/Ncjxkdg82YaGj8630I1hOLl+ZvzBkLgQaH6psmRAlzdGfwV3zy/tBPCWLe0XQEfWl
         k3BuCWjfvvvsGb5lAf692kDNOUi1034l0efXYau3K1kfJHWf8vOIpRD4qDzj7j+5f4OE
         HLwzVU9KsPzTuQKJnfHag2zZHLTWYwsinjwDta0FISE+1AjDSHU+4VF5tqfkW6MtPOxS
         TgtA==
X-Gm-Message-State: AOJu0YwKE/8hDbuR/XtTq4SIHo92Crc8g+msC3wnbUcr4rf+JlPsUVPD
	140s5oMKGU/RyzPitkCNb9uNBqFpJS04WiC7XnSztcGFeOnxh+9Jx6HdcajkkZeTxh2EZAF+x2k
	3LWLcH687UeZ7tpom7OSOBZZiU90=
X-Google-Smtp-Source: AGHT+IFgJvOEYzDiSQevwVI0ocEtX4pZRyLmwpZoc27d86h9KeAVitKFyZgmqaloHsUiNThTj06x3Jfar9zOMemY22k=
X-Received: by 2002:a17:90a:46cc:b0:2db:60b:9be5 with SMTP id
 98e67ed59e1d1-2dd7f761e5dmr4284749a91.8.1727010720403; Sun, 22 Sep 2024
 06:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Sep 2024 15:11:48 +0200
Message-ID: <CANiq72mNeCuPkCDrG2db3w=AX+O-zYrfprisDPmRac_qh65Dmg@mail.gmail.com>
Subject: objtool warnings in Rust defconfig -next
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi LoongArch,

I noticed objtool warnings in a Rust-enabled defconfig build in
linux-next, e.g.:

    rust/core.o: warning: objtool:
_RNvXs1_NtNtCs5QSdWC790r4_4core5ascii10ascii_charNtB5_9AsciiCharNtNtB9_3fmt5Debug3fmt+0x54:
sibling call from callable instruction with modified stack frame

Thanks!

Cheers,
Miguel
