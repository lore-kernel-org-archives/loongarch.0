Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DE1DDF8
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719322102; cv=none; b=hyFQHPoNrxAvKi/VlhY/uUFghgKUchnvgcW46IrodIgVDToDeqC6dkp1fCdV4ddkcYHxsKEYolvHhnHqbNMPjqEsWcGHmnibqoV/+NS7CJfDMN9vMjeF99+57wo5TRcP7zSQBPj+WWn0BDC0a73sJ19yX+GdBmzf/BQKaDO7qJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719322102; c=relaxed/simple;
	bh=Ro4BBFa+Qwg8DrQxdRw5gbUQFYO14MzqTqWpByRnoxU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mez0cS8ZT+8dkCkyEEjH7HHu9ZlHE9pYzYPWWFUlsnX2oa4K+WNxBr7G82O69oSigIJE7W1esy/ChJoqZWGejaz+jAJMmtgft4+QI00T3p8XRCjKC7zS10ZjbW7JrEHsc6EAeWzbK6kF7G7lm4bjIuzFERGq0bBZNp/LhX8vAe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=nCSv7Ege; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="nCSv7Ege"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1719322100;
	bh=Ro4BBFa+Qwg8DrQxdRw5gbUQFYO14MzqTqWpByRnoxU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nCSv7Egem1y/1EEW2UGinuPnR77/Dy1oBhyBKH937gaowacLX/x4xzIwOk5OuxvMS
	 vm8nsvPQWCnoHBJDJ1xDj801fGF5sdeWt/FVE4pxW00enX1v0Z9IiKQqERSYpl3uEI
	 8C7Hlo0dREx+hkwAfogcwcQkv5+aTiOBqejTK850=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id D32031A3FCE;
	Tue, 25 Jun 2024 09:28:16 -0400 (EDT)
Message-ID: <a28d27816a2c5dfab3093a2ba79d5681e927e703.camel@xry111.site>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
From: Xi Ruoyao <xry111@xry111.site>
To: Mateusz Guzik <mjguzik@gmail.com>, brauner@kernel.org
Cc: viro@zeniv.linux.org.uk, jack@suse.cz, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, axboe@kernel.dk, 
	torvalds@linux-foundation.org, loongarch@lists.linux.dev
Date: Tue, 25 Jun 2024 21:28:14 +0800
In-Reply-To: <fa1a8a0b01cd8c53d290cf431b9c1ffc6305ef0d.camel@xry111.site>
References: <20240625110029.606032-1-mjguzik@gmail.com>
	 <20240625110029.606032-3-mjguzik@gmail.com>
	 <fa1a8a0b01cd8c53d290cf431b9c1ffc6305ef0d.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-06-25 at 21:24 +0800, Xi Ruoyao wrote:
> On Tue, 2024-06-25 at 13:00 +0200, Mateusz Guzik wrote:
> > +	if (flags =3D=3D AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
>=20
> Could it be
>=20
> if ((flags & AT_EMPTY_PATH) && vfs_empty_path(dfd, filename))
>=20
> instead?
>=20
> When fstatat is implemented with statx AT_NO_AUTOMOUNT is needed, or at
> least Glibc developers think it's needed:

/* snip */

> I was just surprised when I saw a 100%+ improve for statx("",
> AT_EMPTY_PATH) but not stat on the Loongson machine.
                         ^^^^ fstat

I cannot type :(


--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
