Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F61494A3
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719312776; cv=none; b=g9X0JV2MecTrDBwxPKuvYeQEj2co7gLvR5xtjvL2wvZRMPTTJdxSnEEdB5fnJ1Aikl9Tite6gRm1ohvSknlAPfORH8RdtRT38FFQz4yajgp9fPsF7ttvr2lnGRX6EfLjkhmS+UzAE4qXUrqa18vNhxiAccRja+rIJnM6ayqH0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719312776; c=relaxed/simple;
	bh=vFD+rd/N0ZO2xUJ+4r9RQ68ijp1ed6+yEhJXQ52MV+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dy9fYsp7PZh7OEtqNSuRo2jk1dDVpKPwxUTxXxsW73lK83oZXipjxbXhHd4ewzxHNwhN1mH5uvfXypY78YY/8xEgIbza1/fOvQYFJr4daGhY11BZJfKrQsrqdtSN1/iSOBd9b4vQszVRMQpCtD1Z77QD8xzbNpLW2FHG/RxyLUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmwMAEDk; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmwMAEDk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d280e2d5dso5340538a12.1
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719312773; x=1719917573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFD+rd/N0ZO2xUJ+4r9RQ68ijp1ed6+yEhJXQ52MV+s=;
        b=DmwMAEDk5xSMXb2FB0CiOsDmFOBoETaXVfFyQ+y88iGV5PasBE3cUmtEa1TpaQfdlr
         wjms8dbM8ruM9cHCcGJNr4zO08kMIgDXciqZnrZFXo/EEuKj0EN8Cytw97khYMCqoNY6
         NglNidf10daqTcy5sAhGUXOEtWuqrevnSncOtoexzV7hbZ8RvPsAYsQQACwR0aClMM5v
         r6RnErwzhrsTrf/nJA4m0dK96wcM3VxpDZXnZXJg4UklL07/QxWcWpmO4Ffqtwxdi+8F
         tWM9wg6ceVENz72GBjOAKgtp+9qOylx6v8apguSp467Kcklv388Qrh6WrgsU+lYbGBYq
         sWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719312773; x=1719917573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFD+rd/N0ZO2xUJ+4r9RQ68ijp1ed6+yEhJXQ52MV+s=;
        b=mnS2/Nzys4Xe7GYBrQuLMNMuIhWNod7fkLnMhEEP6JATXeZifkUJRUKkqeCWJWPyCY
         i+F7XxNojv9mavC+6epmWgkm627waYmYdXzVPGS92pNUHUQ+9zzIhCahKD8NqxsuXqLw
         oKWQsIc6X0Yx+GHIyRBKck7K70w6YFL77obhOrMvz8VxogBE9oGTKSCNNSUrzAAC0LpI
         YycI5zPfYek8f6eedKIQk9Ri16KFmn8IYSicLHaK0T3SEWG3iy5WRW+j/aA0yecv6ST0
         7vI5jzbJxqx88Xed9z8zZu7uzxeWOgRqy1txk5JkzpKygSO9ge+UgK/UW2FgWbuhfWv3
         88kg==
X-Forwarded-Encrypted: i=1; AJvYcCXW1NAdf5ZAkIoGaBJ0NzSj8ZCsMlyFD/XOGb67koxH92oDpmUJ5OFrdqTkLQGqxawWkS16vdHlqWU/6DVuSBoqmUOSHlitInEL
X-Gm-Message-State: AOJu0Yz86VwclXKz2lxtxelE/z2TcBLy1TyX63fzVSrwydpnw6dF7JCG
	sHINxF2XoW0OenFsrTQnzMXJ4FNF/Trg2bCGSdXdhlxJ5p/DHAXGxiHG1XWiV2bdNI5x0VBHTFO
	Y2qu3sio/lYcmOd4picneBIVf6Ok=
X-Google-Smtp-Source: AGHT+IGTa887v3D8eziyl3LcY5wiXy2Tj8wU0X39RaxGrXENpYI5ac4WWgcS5FyLRWZK5g48wFj25j5Eqcu4vUAoCQg=
X-Received: by 2002:a50:bac5:0:b0:57d:c8:d295 with SMTP id 4fb4d7f45d1cf-57d4bd566e6mr3835656a12.4.1719312772630;
 Tue, 25 Jun 2024 03:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240624085037.33442-2-xry111@xry111.site> <e2lv3qamggymdjqzujvyhsd2q34jy5tryniac7d446tlaebqwy@5x4zn7z4d3xz>
 <20240625-kindisch-ausgibt-b4feede36bab@brauner> <30a5fe67500c40a4d5f9516e9b549ec796faac74.camel@xry111.site>
In-Reply-To: <30a5fe67500c40a4d5f9516e9b549ec796faac74.camel@xry111.site>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 25 Jun 2024 12:52:39 +0200
Message-ID: <CAGudoHEDKvP926Q6tX1Te_WW9_OTLUoDRTO3nCO3LHo6HJyLpQ@mail.gmail.com>
Subject: Re: [PATCH v2] vfs: Shortcut AT_EMPTY_PATH early for statx, and add
 AT_NO_PATH for statx and fstatat
To: Xi Ruoyao <xry111@xry111.site>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Alejandro Colomar <alx@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Icenowy Zheng <uwu@icenowy.me>, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 12:51=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> On Tue, 2024-06-25 at 10:50 +0200, Christian Brauner wrote:
> > No, let's not waste AT_* flag space in fear of some hypothetical
> > breakage. Let's try it cleanly first and make AT_EMPTY_PATH work with
> > NULL paths.
> >
> > Note, I started working on this (checks ...) 30th April but then some
> > other work came up and I never got back to it (Sorry, Linus). I pushed
> > the branch to #vfs.empty.path now. The top three commits was what I had
> > started doing.
> >
> > It was based on a new vfs_empty_path() helper so we could reuse it for
> > other system calls as well.
>
> If I understand correctly, I should submit a patch against
> vfs.empty.path making statx(fd, NULL, AT_EMPTY_PATH) work then?
>

I just sorted this out, will be sending a patchset shortly.


--=20
Mateusz Guzik <mjguzik gmail.com>
