Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD78A28E4
	for <loongarch@lists.linux.dev>; Thu, 16 Jun 2022 12:27:57 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id q104so1816361qvq.8
        for <loongarch@lists.linux.dev>; Thu, 16 Jun 2022 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=Tb/9B4JyD6AqzWz56Po2RY0/nyxcKsp8HnBptdZsG0LwwbM2HKp6+eIiwWRRK1kcPw
         BrNEtmHlEntfsEBj0pmGU6E5Ru+VjGEEuUoiCJUyz9QSRFWdlHfF1tnRCT4v1YhAKd+G
         3PFrqcgM8Vxvbcec9SXTtFpEHC47tQElW+rL8xhXSlpWw9B+7op/p/uTqbijfV3k6jtm
         5XjuVaTCJDTgpc66e79+yOZnI5gY1+4tsvU2tBVgP/5QZIK39c6la6mibzw+81lNGJol
         krGCNpMuW73XSWTYSAAb3u2sBzqwUfLNd0btPX7k46VRa5Lp150+Npc7SQ2Yjzd6Etu4
         85AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=U/Mk8L8CLT5Bc5zVa+PpMFVtLyWdJRgiJEWZYo/BKJgF0SCEOxp6AhNRZ54Be5Htbk
         X6BiLroocfDRk0+CYkfNTKTRglcL51hTyhxtwACWCGswwRlRtFcjfqEXqm6Kaq/bw6M8
         sn+bBRXZuURCmZ2TyM5dKlS76V9v5atoK3fIzopp25fuOkQNq8MArRngNbrwM8cLmFsi
         ddmYbqJRp1+dwJ6JhEiQTxuxUZ6QTC+I2Cxrv20An5pbv5Ltfu8ZOsfCdR86dofqTdVh
         6o8DmVn9EpWy8mKM+zsurnsIZYxnTjus/wqH1K79peP3K63LoqzbRPQeq/EjBYOfKgQR
         4byQ==
X-Gm-Message-State: AJIora+46ueT6DiOooPQpr8pt1V74c52AXnx9Wy247Rv0edewsmrx8VX
	gKqK932encmlt0bBlJn/4XyBHIDLnQ0ZRqw8oNib4hx+Q5TD
X-Google-Smtp-Source: AGRyM1txVqOQ5HU8VaOjB5BusBbkIdwF/A9YIh6glT1/db2EVxxVpMU77JztxPSeNdXJq4BfOFU3MxNGWbtsdcsXk7o=
X-Received: by 2002:a05:6214:3003:b0:462:1c15:772c with SMTP id
 ke3-20020a056214300300b004621c15772cmr3584526qvb.71.1655382476420; Thu, 16
 Jun 2022 05:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Pujin Shi <shipujin.t@gmail.com>
Date: Thu, 16 Jun 2022 20:27:45 +0800
Message-ID: <CALgz8N+bs74GceCfEfuux1LDf7pBBxTxe0gxJ29WX+-DJgvHqw@mail.gmail.com>
Subject: 
To: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

subscribe
